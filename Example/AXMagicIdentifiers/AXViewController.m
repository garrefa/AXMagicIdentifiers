//
//  AXViewController.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 05/08/2015.
//  Copyright (c) 2014 Alexandre Garrefa. All rights reserved.
//

#import "AXViewController.h"

@interface AXViewController ()

@end

@implementation AXViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self ax_printAccessibilityIdentifiers];
}

@end
