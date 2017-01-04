//
//  ipad.m
//  Reasons
//
//  Created by william on 3/31/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import "ipad.h"

@interface ipad ()

@end

@implementation ipad

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
    // Do any additional setup after loading the view.
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
int imageIndex3 = 0;
- (IBAction)handelswipe:(UISwipeGestureRecognizer *)sender {
    NSArray *images=[[NSArray alloc] initWithObjects:
                     @"P1C1.jpg",
                     @"P1C2.jpg",
                     @"P1C3.jpg",
                     @"P1C4.jpg",
                     @"P1C5.jpg",
                     @"P1C6.jpg",
                     @"P1C7.jpg",
                     @"P1C8.jpg",
                     @"P1C9.jpg",
                     @"P1C10.jpg",nil];
    
    UISwipeGestureRecognizerDirection direction =
    [(UISwipeGestureRecognizer *) sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex3++;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex3--;
            break;
        default:
            break;
    }
    imageIndex3 = (imageIndex3 < 0) ? ([images count] -1):
    imageIndex3 % [images count];
    _imageview.image = [UIImage imageNamed:[images objectAtIndex:imageIndex3]];
    
    
    
    
   }


@end
