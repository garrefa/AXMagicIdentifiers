//
//  AXViewControllerWithTable.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/12/15.
//  Copyright (c) 2015 Alexandre Garrefa. All rights reserved.
//

#import "AXViewControllerWithTable.h"
#import "AXTableViewCell.h"

@interface AXViewControllerWithTable ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AXViewControllerWithTable

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    AXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.aTextLabel.text = @"cell";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"accID: %@",cell.contentView.accessibilityIdentifier);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self ax_printAccessibilityIdentifiers];
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"accID: %@",cell.contentView.accessibilityIdentifier);
}

@end
