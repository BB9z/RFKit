/*!
    NSLayoutConstraint extension
    RFKit

    Copyright (c) 2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (RFKit)

/**
 Force the reciver affected view lay out the subviews immediately.
 */
- (void)updateLayoutIfNeeded;

@end
