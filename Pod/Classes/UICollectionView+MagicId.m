//
//  UICollectionView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/13/15.
//
//

#import "UICollectionView+MagicId.h"
#import "UIView+MagicId.h"

#import <objc/runtime.h>
#import <JRSwizzle/JRSwizzle.h>

@interface UICollectionView (_MagicId) <UICollectionViewDataSource>

@property (nonatomic, weak, setter = ax_setRealDataSource:) id <UICollectionViewDataSource> ax_realDataSource;

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
@implementation UICollectionView (_MagicId)
#pragma clang diagnostic pop

@dynamic ax_realDataSource;

#pragma mark - Add Associated Objects

- (void)ax_setRealDataSource:(id<UICollectionViewDataSource>)realDataSource {
    
    objc_setAssociatedObject(self, @selector(ax_realDataSource), realDataSource, OBJC_ASSOCIATION_ASSIGN);
}

- (id <UICollectionViewDataSource> )ax_realDataSource {
    
    return objc_getAssociatedObject(self, @selector(ax_realDataSource));
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __strong typeof(self) self = weakSelf;
        
        if(!self.accessibilityIdentifier) {
            NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",self.ax_prefix];
            self.accessibilityIdentifier = viewId;
        }
    });
    
    UICollectionViewCell *cell = [self.ax_realDataSource collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    if(!cell.contentView.accessibilityIdentifier) {
        cell.contentView.accessibilityIdentifier =
        [self.ax_prefix stringByAppendingFormat:@"_CELL_S%ldI%ld",(long)indexPath.section,(long)indexPath.item];
    }
    [cell.contentView ax_addAccId];
    
    return cell;
}

#pragma mark - DataSource Message Forwarding

- (BOOL)respondsToSelector:(SEL)aSelector {
    
    return [super respondsToSelector:aSelector] || [self.ax_realDataSource respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    return [super methodSignatureForSelector:aSelector] ?:
    [(id)self.ax_realDataSource methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    id dataSource = self.ax_realDataSource;
    if ([dataSource respondsToSelector:anInvocation.selector]) {
        
        [anInvocation invokeWithTarget:dataSource];
    }
    else [super forwardInvocation:anInvocation];
}

@end



@implementation UICollectionView (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(setDataSource:)
                     withMethod:@selector(ax_setDataSource:) error:nil];
    });
}

- (void)ax_setDataSource:(id<UICollectionViewDataSource>)dataSource {
    
    self.ax_realDataSource = dataSource;
    
    [self ax_setDataSource:self];
}

@end
