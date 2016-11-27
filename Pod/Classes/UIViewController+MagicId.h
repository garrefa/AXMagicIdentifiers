//
//  UIViewController+MagicId.h
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/8/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MagicId)

- (void)ax_addAccId;
- (void)ax_printAccessibilityIdentifiers;
- (NSString *)ax_accessibilityIdentifierTagForInstanceOfClass:(Class)class;

@end
