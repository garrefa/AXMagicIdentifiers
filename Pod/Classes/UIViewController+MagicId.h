//
//  UIViewController+MagicId.h
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/8/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MagicId)

@property (nonatomic, copy, setter = ax_setPrefix:) NSString *ax_prefix;

- (void)ax_printAccessibilityIdentifiers;

@end
