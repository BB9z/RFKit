/*!
    Scroll extension for UIScrollView
    RFKit

    Copyright (c) 2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import <UIKit/UIKit.h>

@interface UIScrollView (RFScrolling)

/**
 Make the receiver scroll to the top.
 
 @param animated `YES` if the scrolling should be animated, `NO` if it should be immediate.
 */
- (void)scrollToTopAnimated:(BOOL)animated;

/**
 Make the receiver scroll to the bottom.

 @param animated `YES` if the scrolling should be animated, `NO` if it should be immediate.
 */
- (void)scrollToBottomAnimated:(BOOL)animated;

@end

@interface UITableView (RFScrolling)

/**
 Make the receiver scrolls the last row of interest to the bottom of the visible table view.

 @param animated `YES` if the scrolling should be animated, `NO` if it should be immediate.
 */
- (void)scrollToLastRowAnimated:(BOOL)animated;

@end
