/*!
    UIViewController extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

@interface UIViewController (RFKit)
- (void)setNavTitle:(NSString *)title back:(NSString *)backTitle;

- (void)addChildViewController:(UIViewController *)childController intoView:(UIView *)subview;

- (void)removeFromParentViewControllerAndView;

- (void)dismissKeyboard;
@end
