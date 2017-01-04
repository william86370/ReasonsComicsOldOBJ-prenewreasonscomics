//
//  ViewController.h
//  reasons
//
//  Created by william on 3/25/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController<
SKProductsRequestDelegate,SKPaymentTransactionObserver>


@end