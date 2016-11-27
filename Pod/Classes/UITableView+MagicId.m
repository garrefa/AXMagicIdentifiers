//
//  UITableView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/12/15.
//
//

#import "UITableView+MagicId.h"
#import "UIView+MagicId.h"

#import <objc/runtime.h>
#import <JRSwizzle/JRSwizzle.h>

@interface UITableView (_MagicId) <UITableViewDataSource>

@property (nonatomic, weak, setter = ax_setRealDataSource:) id <UITableViewDataSource> ax_realDataSource;

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
@implementation UITableView (_MagicId)
#pragma clang diagnostic pop

@dynamic ax_realDataSource;

#pragma mark - Add Associated Objects

- (void)ax_setRealDataSource:(id<UITableViewDataSource>)realDataSource {
    
    objc_setAssociatedObject(self, @selector(ax_realDataSource), realDataSource, OBJC_ASSOCIATION_ASSIGN);
}

- (id <UITableViewDataSource> )ax_realDataSource {
    
    return objc_getAssociatedObject(self, @selector(ax_realDataSource));
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    __weak typeof(self) weakSelf = self;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __strong typeof(self) self = weakSelf;
        
        if(!self.accessibilityIdentifier) {
            NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",self.ax_prefix];
            self.accessibilityIdentifier = viewId;
        }
    });
    
    UITableViewCell *cell = [self.ax_realDataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    
    if(!cell.contentView.accessibilityIdentifier) {
        cell.contentView.accessibilityIdentifier =
        [self.ax_prefix stringByAppendingFormat:@"_CELL_S%ldR%ld",(long)indexPath.section,(long)indexPath.row];
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



@implementation UITableView (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(setDataSource:)
                     withMethod:@selector(ax_setDataSource:) error:nil];
    });
}

- (void)ax_setDataSource:(id<UITableViewDataSource>)dataSource {
    
    self.ax_realDataSource = dataSource;
    
    [self ax_setDataSource:self];
}

@end
