//
//  PagedScrollViewController2.h
//  Reasons
//
//  Created by william on 4/9/14.
//  Copyright (c) 2014 reasons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagedScrollViewController2 : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@end
