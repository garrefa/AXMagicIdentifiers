//
//  UIView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIView+MagicId.h"
#import "UIButton+MagicId.h"

@implementation UIView (MagicId)

- (NSString *)ax_prefix {
    
    id obj = self.nextResponder;
    while([obj isKindOfClass:UIView.class]) {
        obj = ((UIView *)obj).nextResponder;
    }
    return NSStringFromClass([obj class]);
}

- (void)ax_addAccIds {
    
    for (id obj in self.subviews) {
        
        if([obj isKindOfClass:UIButton.class]) [((UIButton *)obj) ax_addAccIdToButton];
        else if([obj isKindOfClass:UIView.class]) [((UIView *)obj) ax_addAccIds];
    }
}

@end