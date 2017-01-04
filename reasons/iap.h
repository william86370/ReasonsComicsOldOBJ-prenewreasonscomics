//
//  iap.h
//  Reasons
//
//  Created by william wright on 8/15/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

BOOL areAdsRemoved;



@interface iap : UIViewController

- (IBAction)purchase;
- (IBAction)restore;
- (IBAction)tapsRemoveAds;



@end
