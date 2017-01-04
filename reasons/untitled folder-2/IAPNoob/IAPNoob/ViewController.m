//
//  ViewController.m
//  IAPNoob
//
//  Created by Emir Fithri Samsuddin on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SFHFKeychainUtils.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize feature2Btn, featureLabel, statusLabel;

#define kStoredData @"com.emirbytes.IAPNoobService"




-(BOOL)IAPItemPurchased {
    
    // check userdefaults key
    
    NSError *error = nil;
    NSString *password = [SFHFKeychainUtils getPasswordForUsername:@"IAPNoob01" andServiceName:kStoredData error:&error];
    
    if ([password isEqualToString:@"whatever"]) return YES; else return NO;
    
}

-(IBAction)doFeature1:(id)sender {
    featureLabel.text = @"Feature: 1";
}

-(IBAction)doFeature2:(id)sender {
    
    if ([self IAPItemPurchased]) {
    
        // do the feature 2!
        featureLabel.text = @"Feature: 2"; 
        
    } else {
        // not purchased so show a view to prompt for purchase
        askToPurchase = [[UIAlertView alloc] 
                            initWithTitle:@"Feature 2 Locked" 
                            message:@"Purchase Feature 2?"
                            delegate:self 
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Yes", @"No", nil]; 
        askToPurchase.delegate = self;
        [askToPurchase show];
        [askToPurchase release];
    }
}


#pragma mark StoreKit Delegate

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                
                // show wait view here
                statusLabel.text = @"Processing...";
                break;
                
            case SKPaymentTransactionStatePurchased:
            
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                // remove wait view and unlock feature 2
                statusLabel.text = @"Done!";
                UIAlertView *tmp = [[UIAlertView alloc] 
                                    initWithTitle:@"Complete" 
                                    message:@"You have unlocked Feature 2!"
                                    delegate:self 
                                    cancelButtonTitle:nil 
                                    otherButtonTitles:@"Ok", nil]; 
                [tmp show];
                [tmp release];
                
                
                NSError *error = nil;
                [SFHFKeychainUtils storeUsername:@"IAPNoob01" andPassword:@"whatever" forServiceName:kStoredData updateExisting:YES error:&error];
                
                // apply purchase action  - hide lock overlay and
                [feature2Btn setBackgroundImage:nil forState:UIControlStateNormal];

                // do other thing to enable the features
                
                break;
                
            case SKPaymentTransactionStateRestored:
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                // remove wait view here
                statusLabel.text = @"";
                break;
                
            case SKPaymentTransactionStateFailed:
                
                if (transaction.error.code != SKErrorPaymentCancelled) {
                    NSLog(@"Error payment cancelled");
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                // remove wait view here
                statusLabel.text = @"Purchase Error!";
                break;
                
            default:
                break;
        }
    }
}






-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response  
{  
    
    // remove wait view here
    statusLabel.text = @"";
    
    SKProduct *validProduct = nil;
    int count = [response.products count];
    
    if (count>0) {
        validProduct = [response.products objectAtIndex:0];
        
        SKPayment *payment = [SKPayment paymentWithProductIdentifier:@"com.emirbytes.IAPNoob.01"];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
        
        
    } else {
        UIAlertView *tmp = [[UIAlertView alloc] 
                            initWithTitle:@"Not Available" 
                            message:@"No products to purchase"
                            delegate:self 
                            cancelButtonTitle:nil 
                            otherButtonTitles:@"Ok", nil]; 
        [tmp show];
        [tmp release];
    }
    
    
}  

-(void)requestDidFinish:(SKRequest *)request  
{  
    [request release];  
}  

-(void)request:(SKRequest *)request didFailWithError:(NSError *)error  
{  
    NSLog(@"Failed to connect with error: %@", [error localizedDescription]);  
}  



#pragma mark AlertView Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 
    if (alertView==askToPurchase) {
        if (buttonIndex==0) {
            // user tapped YES, but we need to check if IAP is enabled or not.
            if ([SKPaymentQueue canMakePayments]) { 
                
                SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:@"com.emirbytes.IAPNoob.01"]];  
                
                request.delegate = self;  
                [request start];  
                
                
            } else {
                UIAlertView *tmp = [[UIAlertView alloc] 
                                    initWithTitle:@"Prohibited" 
                                    message:@"Parental Control is enabled, cannot make a purchase!"
                                    delegate:self 
                                    cancelButtonTitle:nil 
                                    otherButtonTitles:@"Ok", nil]; 
                [tmp show];
                [tmp release];
            }
        }
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([self IAPItemPurchased]) {
        [feature2Btn setBackgroundImage:nil forState:UIControlStateNormal];

    } else {
        [feature2Btn setBackgroundImage:[UIImage imageNamed:@"Locked.png"] forState:UIControlStateNormal];

    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
