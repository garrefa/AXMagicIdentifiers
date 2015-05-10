//
//  UITextView+MagicId.m
//  Pods
//
//  Created by Alexandre Garrefa on 5/10/15.
//
//

#import "UITextView+MagicId.h"
#import "UIView+MagicId.h"

@implementation UITextView (MagicId)

static NSNumber *idsCounter = 0;

#pragma mark - Public Utils

- (void)ax_addAccId {
    
    idsCounter = @(idsCounter.integerValue + 1);
    NSString *tag = idsCounter.stringValue;
    self.accessibilityIdentifier =
    [@"" stringByAppendingFormat:@"%@_TXTVIEW_%@",self.ax_prefix,tag];
}

@end
