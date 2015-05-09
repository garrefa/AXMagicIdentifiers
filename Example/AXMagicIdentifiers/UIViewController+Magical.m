//
//  UIViewController+Magical.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/9/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import "UIViewController+Magical.h"

#import <objc/runtime.h>

@implementation UIViewController (Magical)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewDidAppear:);
        SEL swizzledSelector = @selector(axz_viewDidAppear:);
        
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

- (void)axz_viewDidAppear:(BOOL)animated {
    
    [self ax_printAccessibilityIdentifiers];
    
    [self axz_viewDidAppear:animated];
}

@end
