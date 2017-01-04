
//
//  InAppDemoViewController.m
//  Reasons
//
//  Created by william on 5/31/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import "InAppDemoViewController.h"




@interface InAppDemoViewController ()

@end

@implementation InAppDemoViewController

- (IBAction)purchaseItem:(id)sender {
    
    _purchaseController.productID =
    @"reasons.comics.subscribe2014";
    
    [self.navigationController
     pushViewController:_purchaseController animated:YES];
    
    [_purchaseController getProductInfo: self];
}

-(void)enableLevel2
{

NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

[userDefaults setBool:NO forKey:@"isPurchase"];

[userDefaults synchronize];



    
    
    _level2Button.enabled = YES;
}
























- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     _buy.enabled = true;
   
    
    _purchaseController = [[PurchaseViewController alloc]init];
    
    [[SKPaymentQueue defaultQueue]
     addTransactionObserver:_purchaseController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

