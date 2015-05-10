//
//  UIButton+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIButton+MagicId.h"
#import "UIView+MagicId.h"
#import <objc/runtime.h>

@implementation UIButton (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setTitle:forState:);
        SEL swizzledSelector = @selector(ax_setTitle:forState:);
        
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

- (void)ax_setTitle:(NSString *)title forState:(UIControlState)state {

    [self ax_setTitle:title forState:state];
    [self ax_addAccId];
}

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    NSString *title = self.titleLabel.text;
    title = [title stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    self.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_BUTTON_%@",self.ax_prefix,title];
}

@end
