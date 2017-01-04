//
//  view6.m
//  reasons
//
//  Created by william on 3/25/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import "view6.h"

@implementation view6






- (IBAction)facebook:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/ReasonsApp"]] ;
}







- (IBAction)twiter:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ReasonsApp"]] ;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
