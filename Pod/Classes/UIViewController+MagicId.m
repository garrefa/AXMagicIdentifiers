//
//  UIViewController+MagicId.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/8/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import "UIViewController+MagicId.h"
#import "UIButton+MagicId.h"
#import "UIView+MagicId.h"
#import <objc/runtime.h>

@implementation UIViewController (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewDidLayoutSubviews);
        SEL swizzledSelector = @selector(ax_viewDidLayoutSubviews);
        
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

- (void)ax_viewDidLayoutSubviews {
        
    NSString *prefix = NSStringFromClass(self.class);
    NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",prefix];
    self.view.accessibilityIdentifier = viewId;
    
    [self.view ax_addAccIds];
    
    [self ax_viewDidLayoutSubviews];
}

#pragma mark - Public Utils

- (void)ax_printAccessibilityIdentifiers {
    
    NSLog(@"accID: %@",self.view.accessibilityIdentifier);
    [self ax_printAccessibilityIdentifiersInView:self.view];
}

#pragma mark - Private Utils

- (void)ax_printAccessibilityIdentifiersInView:(UIView *)view {
    
    for (id obj in view.subviews) {
        
        if([obj isKindOfClass:UIButton.class])
            NSLog(@"accID: %@",((UIButton *)obj).accessibilityIdentifier);
        else if([obj isKindOfClass:UIView.class])
            [self ax_printAccessibilityIdentifiersInView:obj];
    }
}

@end
