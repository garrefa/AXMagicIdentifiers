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
#import <JRSwizzle/JRSwizzle.h>

@implementation UICollectionViewController (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(collectionView:cellForItemAtIndexPath:)
                     withMethod:@selector(ax_collectionView:cellForItemAtIndexPath:) error:nil];
    });
}

#pragma mark - Method Swizzling

- (UICollectionViewCell *)ax_collectionView:(UICollectionView *)collectionView
                     cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __strong typeof(weakSelf) self = weakSelf;
        
        if (!self.view.accessibilityIdentifier) {
            NSString *prefix = NSStringFromClass(self.class);
            NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",prefix];
            self.view.accessibilityIdentifier = viewId;
        }
    });
    
    UICollectionViewCell *cell = [self ax_collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    if(!cell.contentView.accessibilityIdentifier) {
        NSString *prefix = NSStringFromClass(self.class);
        
        cell.contentView.accessibilityIdentifier =
        [prefix stringByAppendingFormat:@"_CELL_S%ldI%ld",(long)indexPath.section,(long)indexPath.item];
    }
    
    [cell.contentView ax_addAccId];    
    
    return cell;
}

@end
