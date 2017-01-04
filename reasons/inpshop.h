//
//  inpshop.h
//  Reasons
//
//  Created by william wright on 8/15/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

BOOL doRemoveAds;



@interface inpshop : UIView

- (IBAction)purchase;
- (IBAction)restore;
- (IBAction)tapsRemoveAdsButton;

@end
