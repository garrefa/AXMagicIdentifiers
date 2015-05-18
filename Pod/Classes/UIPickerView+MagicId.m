//
//  UIPickerView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UIPickerView+MagicId.h"
#import "UIViewController+MagicId.h"
#import "UIView+MagicId.h"

@implementation UIPickerView (MagicId)

static NSNumber *idsCounter = 0;

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    if (self.accessibilityIdentifier) return;
    NSString *tag = [self ax_accessibilityIdentifierTag];
    self.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_PVIEW_%@",self.ax_prefix,tag];
}

@end
