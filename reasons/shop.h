//
//  shop.h
//  Reasons
//
//  Created by william wright on 8/15/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface shop : NSObject
BOOL areAdsRemoved;

- (IBAction)purchase;
- (IBAction)restore;
- (IBAction)tapsRemoveAdsButton;


@end
