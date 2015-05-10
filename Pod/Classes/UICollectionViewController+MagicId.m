//
//  UICollectionViewController+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UICollectionViewController+MagicId.h"
#import "UIViewController+MagicId.h"
#import "UIView+MagicId.h"
#import <objc/runtime.h>

@implementation UICollectionViewController (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(collectionView:cellForItemAtIndexPath:);
        SEL swizzledSelector = @selector(ax_collectionView:cellForItemAtIndexPath:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (UICollectionViewCell *)ax_collectionView:(UICollectionView *)collectionView
                     cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __strong typeof(self) self = weakSelf;
        
        NSString *prefix = NSStringFromClass(self.class);
        NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",prefix];
        self.view.accessibilityIdentifier = viewId;
    });
    
    UICollectionViewCell *cell = [self ax_collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    NSString *prefix = NSStringFromClass(self.class);
    
    cell.accessibilityIdentifier =
    [prefix stringByAppendingFormat:@"_CELL_S%ldR%ld",(long)indexPath.section,(long)indexPath.row];
    
    [cell.contentView ax_addAccId];
    
    return cell;
}

@end
