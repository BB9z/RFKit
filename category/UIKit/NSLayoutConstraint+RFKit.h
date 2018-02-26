/*!
    NSLayoutConstraint extension
    RFKit

    Copyright (c) 2014-2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (RFKit)

/**
 Force the reciver affected view lay out the subviews immediately.
 */
- (void)updateLayoutIfNeeded API_AVAILABLE(ios(6.0), tvos(9.0));

@end
