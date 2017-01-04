//
//  PurchaseViewController.h
//  Reasons
//
//  Created by william on 5/31/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface PurchaseViewController : UIViewController
<SKPaymentTransactionObserver, SKProductsRequestDelegate>

@property (strong, nonatomic) SKProduct *product;
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) IBOutlet UILabel *productTitle;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;
@property (strong, nonatomic) IBOutlet UITextView *productDescription;
- (IBAction)buyProduct:(id)sender;
- (void)getProductInfo:(UIViewController *)viewController;
@end
