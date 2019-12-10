/*!
 UIAlertView extension
 RFKit
 
 Copyright (c) 2012-2013, 2015-2016, 2018-2019 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UIAlertView (RFKit)

/**
 Creates an alert view and displays using animation.
 
 @param title The string that appears in the receiver’s title bar.
 @param message Descriptive text that provides more details than the title.
 @param buttonTitle The title of the cancel button. If nil, OK will be used.
 */
+ (void)showWithTitle:(nullable NSString *)title message:(nullable NSString *)message buttonTitle:(nullable NSString *)buttonTitle API_AVAILABLE(ios(2.0));

@end
