//
//  ViewController.h
//  IAPNoob
//
//  Created by Emir Fithri Samsuddin on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController <SKProductsRequestDelegate, SKPaymentTransactionObserver, UIAlertViewDelegate> {
    IBOutlet UIButton *feature2Btn;
    IBOutlet UILabel *featureLabel, *statusLabel;
    UIAlertView *askToPurchase;
}

@property (nonatomic, retain)  UIButton *feature2Btn;
@property (nonatomic, retain)  UILabel *featureLabel, *statusLabel;

-(IBAction)doFeature1:(id)sender;
-(IBAction)doFeature2:(id)sender;
-(BOOL)IAPItemPurchased;

@end
