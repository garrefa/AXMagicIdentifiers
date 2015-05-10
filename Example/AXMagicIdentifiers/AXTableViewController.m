//
//  AXTableViewController.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/9/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import "AXTableViewController.h"

@implementation AXTableViewController

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"accID: %@",cell.accessibilityIdentifier);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self ax_printAccessibilityIdentifiers];
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"accID: %@",cell.accessibilityIdentifier);
}

@end
