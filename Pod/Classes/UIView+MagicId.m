//
//  UIView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIView+MagicId.h"

@implementation UIView (MagicId)

#pragma mark - Public Utils

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