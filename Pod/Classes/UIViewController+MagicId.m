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

@interface UIViewController (_MagicId)

@property (nonatomic, weak, setter = ax_setIdsCountDictionary:) NSDictionary *ax_idsCountDictionary;

@end

@implementation UIViewController (_MagicId)

@dynamic ax_idsCountDictionary;

#pragma mark - Add Associated Objects

- (void)ax_setIdsCountDictionary:(NSDictionary *)ax_idsCountDictionary {
    
    objc_setAssociatedObject(self, @selector(ax_idsCountDictionary), ax_idsCountDictionary, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)ax_idsCountDictionary {
    
    return objc_getAssociatedObject(self, @selector(ax_idsCountDictionary));
}

@end



@implementation UIViewController (MagicId)

//+ (void)load {
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//        Class class = [self class];
//        
//        [class jr_swizzleMethod:@selector(viewDidLoad)
//                     withMethod:@selector(ax_viewDidLoad) error:nil];
//    });
//}

//#pragma mark - Method Swizzling
//
//- (void)ax_viewDidLoad {
//    
//    [self ax_addAccId];
//    
//    [self ax_viewDidLoad];
//}

#pragma mark - Public Utils

- (void)ax_printAccessibilityIdentifiers {
    
    NSLog(@"accID: %@",self.view.accessibilityIdentifier);
    [self ax_printAccessibilityIdentifiersInView:self.view];
}

- (NSString *)ax_accessibilityIdentifierTagForInstanceOfClass:(Class)class {
    
    NSString *key = NSStringFromClass(class);
    NSMutableDictionary *dic =
    [NSMutableDictionary dictionaryWithDictionary:self.ax_idsCountDictionary];
    NSNumber *count = dic[key];
    if (count) count = @(count.integerValue+1);
    else count = @(1);
    [dic setObject:count forKey:key];
    self.ax_idsCountDictionary = dic;
    return count.stringValue;
}

- (void)ax_addAccId {
    
    if(!self.view.accessibilityIdentifier) {
        NSString *viewId = [@"" stringByAppendingFormat:@"%@_VIEW",self.view.ax_prefix];
        self.view.accessibilityIdentifier = viewId;
    }
    
    [self.view ax_addAccId];
}

#pragma mark - Private Utils

- (void)ax_printAccessibilityIdentifiersInView:(UIView *)view {
    
    for (id obj in view.subviews) {
        
        if ([obj respondsToSelector:@selector(accessibilityIdentifier)]) {
            NSLog(@"accID: %@",[obj performSelector:@selector(accessibilityIdentifier)]);
        }
        
        if([obj isKindOfClass:UIView.class])
            [self ax_printAccessibilityIdentifiersInView:obj];
    }
}

@end
