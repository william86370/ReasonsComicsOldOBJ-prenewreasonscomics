//
//  ipad.h
//  Reasons
//
//  Created by william on 3/31/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ipad : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)handelswipe:(UISwipeGestureRecognizer *)sender;

@end
