//
//  UIView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIView+MagicId.h"
#import "UIViewController+MagicId.h"
#import <JRSwizzle.h>

@implementation UIView (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(addSubview:)
                     withMethod:@selector(ax_addSubview:) error:nil];
    });
}

#pragma mark - Method Swizzle

- (void)ax_addSubview:(UIView *)view {
    
    [self ax_addSubview:view];
    
    if ([view respondsToSelector:@selector(ax_addAccId)])
        [view performSelector:@selector(ax_addAccId) withObject:nil afterDelay:0.2];
}

#pragma mark - Public Utils

- (NSString *)ax_accessibilityIdentifierTag {

    UIViewController *vc = [self ax_ViewController];
    return [vc ax_accessibilityIdentifierTagForInstanceOfClass:self.class];
}

- (UIViewController *)ax_ViewController {
    
    id obj = self.nextResponder;
    while([obj isKindOfClass:UIView.class]) {
        obj = ((UIView *)obj).nextResponder;
    }
    return obj;
}

- (NSString *)ax_prefix {
    
    return [@"AX_" stringByAppendingString:NSStringFromClass(self.ax_ViewController.class)];
}

- (void)ax_addAccId {
    
    for (id obj in self.subviews) {
        
        if ([obj respondsToSelector:@selector(ax_addAccId)]) {
            [obj performSelector:@selector(ax_addAccId)];
        }
    }
}

@end