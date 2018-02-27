/*!
    UIButton extension
    RFKit

    Copyright (c) 2012-2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UIButton (RFKit)

/** Change the background image to be resizable with the specified cap insets for the specified button state.

 @param capInsets The values to use for the cap insets.
 @param state The state that uses the specified image. The values are described in UIControlState.
 */
- (void)setBackgroundImageResizingCapInsets:(UIEdgeInsets)capInsets forState:(UIControlState)state API_AVAILABLE(ios(2.0), tvos(9.0));

@end
