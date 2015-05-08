//
//  UIViewController+MagicId.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/8/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import "UIViewController+MagicId.h"

#import <objc/runtime.h>

@interface UIViewController (_MagicId)

@property (nonatomic, copy, setter = ax_setPrefix:) NSString *ax_prefix;

@end

@implementation UIViewController (_MagicId)
@dynamic ax_prefix;

- (NSString *)ax_prefix {
    
    return (NSString *)objc_getAssociatedObject(self, @selector(ax_prefix));
}

- (void)ax_setPrefix:(NSString *)ax_prefix {
    
    objc_setAssociatedObject(self, @selector(ax_prefix), ax_prefix, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

@implementation UIViewController (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(ax_viewWillAppear:);
        
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

- (void)ax_viewWillAppear:(BOOL)animated {
    
    [self ax_viewWillAppear:animated];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        self.ax_prefix = NSStringFromClass(self.class);
        NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",self.ax_prefix];
        self.view.accessibilityIdentifier = viewId;
        
        [self ax_scanView:self.view];
    });
}

#pragma mark - Public Utils

- (void)ax_printAccessibilityIdentifiers {
    
    NSLog(@"accID: %@",self.view.accessibilityIdentifier);
    [self ax_printAccessibilityIdentifiersInView:self.view];
}

#pragma mark - Private Utils

- (void)ax_scanView:(UIView *)view {
    
    for (id obj in view.subviews) {
        
        if([obj isKindOfClass:UIButton.class]) [self ax_idToButton:obj];
        else if([obj isKindOfClass:UIView.class]) [self ax_scanView:obj];
    }
}

- (void)ax_idToButton:(UIButton *)button {

    NSString *title = button.titleLabel.text;
    title = [title stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    button.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_BUTTON_%@",self.ax_prefix,title];
}

- (void)ax_printAccessibilityIdentifiersInView:(UIView *)view {
    
    for (id obj in view.subviews) {
        
        if([obj isKindOfClass:UIButton.class])
            NSLog(@"accID: %@",((UIButton *)obj).accessibilityIdentifier);
        else if([obj isKindOfClass:UIView.class])
            [self ax_printAccessibilityIdentifiersInView:obj];
    }
}

@end