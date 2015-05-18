//
//  UIButton+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIButton+MagicId.h"
#import "UIView+MagicId.h"
#import <JRSwizzle/JRSwizzle.h>

@implementation UIButton (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(setTitle:forState:)
                     withMethod:@selector(ax_setTitle:forState:) error:nil];
    });
}

#pragma mark - Method Swizzling

- (void)ax_setTitle:(NSString *)title forState:(UIControlState)state {

    [self ax_setTitle:title forState:state];
    [self performSelector:@selector(ax_addAccId) withObject:nil afterDelay:0.5];
}

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    if (!self.accessibilityIdentifier.length || [self.accessibilityIdentifier hasPrefix:@"AX_"]) {
        NSString *title = self.titleLabel.text;
        title = [title stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        self.accessibilityIdentifier =
        [@"" stringByAppendingFormat:@"%@_BUTTON_%@",self.ax_prefix,title];
    }
}

@end
