//
//  UIViewController+MagicId.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/8/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import "UIViewController+MagicId.h"
#import "UIView+MagicId.h"

#import <objc/runtime.h>
#import <JRSwizzle/JRSwizzle.h>

@implementation UIViewController (MagicId)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Class class = [self class];
        
        [class jr_swizzleMethod:@selector(viewDidLayoutSubviews)
                     withMethod:@selector(ax_viewDidLayoutSubviews) error:nil];
    });
}

#pragma mark - Method Swizzling

- (void)ax_viewDidLayoutSubviews {
    
    if(!self.view.accessibilityIdentifier) {
        NSString *prefix = NSStringFromClass(self.class);
        NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",prefix];
        self.view.accessibilityIdentifier = viewId;
    }
    
    [self.view ax_addAccId];
    
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
