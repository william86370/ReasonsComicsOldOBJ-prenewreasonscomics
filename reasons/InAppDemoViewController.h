//
//  InAppDemoViewController.h
//  Reasons
//
//  Created by william on 5/31/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "PurchaseViewController.h"


@interface InAppDemoViewController : UIViewController

- (IBAction)purchaseItem:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *level2Button;
@property (strong, nonatomic) PurchaseViewController *purchaseController;
-(void)enableLevel2;



@property (strong, nonatomic) IBOutlet UIButton *buy;



@end