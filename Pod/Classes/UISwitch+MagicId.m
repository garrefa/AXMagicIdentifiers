//
//  UISwitch+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UISwitch+MagicId.h"
#import "UIView+MagicId.h"

@implementation UISwitch (MagicId)

static NSNumber *idsCounter = 0;

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    if (self.accessibilityIdentifier) return;
    idsCounter = @(idsCounter.integerValue + 1);
    NSString *tag = idsCounter.stringValue;
    self.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_SWITCH_%@",self.ax_prefix,tag];
}

@end
