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

- (NSString *)ax_prefix {
    
    id obj = self.nextResponder;
    while([obj isKindOfClass:UIView.class]) {
        obj = ((UIView *)obj).nextResponder;
    }
    return NSStringFromClass([obj class]);
}

- (void)ax_addAccId {
    
    for (id obj in self.subviews) {
        
        if ([obj respondsToSelector:@selector(ax_addAccId)]) {
            [obj performSelector:@selector(ax_addAccId)];
        }
    }
}

#pragma mark - Private Utils

- (BOOL)obj:(id)obj isKindOfAnyClassInArray:(NSArray *)classes {
    
    for (Class aClass in classes) {
        
        if([obj isKindOfClass:aClass]) return TRUE;
    }
    
    return FALSE;
}

@end