//
//  MasterViewController.m
//  Reasons
//
//  Created by william on 5/28/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import "MasterViewController.h"
#import "ViewController.h"

// 1
#import "RageIAPHelper.h"
#import <StoreKit/StoreKit.h>

// 2
@interface MasterViewController () {
    NSArray *_products;
}
@end

@implementation MasterViewController

// 3
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"In App Rage";
    
    
}

// 4
- (void)reload {
    _products = nil;
    
    [[RageIAPHelper sharedInstance] requestProductsWithCompletionHandler:^(BOOL success, NSArray *products) {
        if (success) {
            _products = products;
         
 


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// 5
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    SKProduct * product = (SKProduct *) _products[indexPath.row];
    cell.textLabel.text = product.localizedTitle;
    
    return cell;
}

@end