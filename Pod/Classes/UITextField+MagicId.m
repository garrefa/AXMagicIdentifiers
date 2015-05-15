//
//  UITextField+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UITextField+MagicId.h"
#import "UIViewController+MagicId.h"
#import "UIView+MagicId.h"

@implementation UITextField (MagicId)

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    if (self.accessibilityIdentifier) return;
    NSString *tag =
    [self.ax_ViewController ax_nextAccessibilityIdentifierIndexForInstanceOfClass:self.class];
    self.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_TFIELD_%@",self.ax_prefix,tag];
}

@end
