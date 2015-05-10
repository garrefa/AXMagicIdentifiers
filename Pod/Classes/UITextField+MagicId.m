//
//  UITextField+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UITextField+MagicId.h"
#import "UIView+MagicId.h"

@implementation UITextField (MagicId)

static NSNumber *idsCounter = 0;

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    idsCounter = @(idsCounter.integerValue + 1);
    NSString *tag = idsCounter.stringValue;
    self.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_TFIELD_%@",self.ax_prefix,tag];
}

@end
