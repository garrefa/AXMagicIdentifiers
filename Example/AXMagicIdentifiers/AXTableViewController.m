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
    
    NSLog(@"acc: %@",cell.accessibilityIdentifier);
}

@end
