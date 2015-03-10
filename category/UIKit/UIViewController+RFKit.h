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

/** Return a view which can present another view controller.
 
 @discussion First we get an window´s root view controller. Then  traverse its presentedViewController property until the presentedViewController property is nil.
 
 @return A view controller which can present another view controller.
 */
+ (UIViewController *)rootViewControllerWhichCanPresentModalViewController;

/** Adds the given view controller as a child and add its view to specified view as a subview.
 
 @discussion Using this method, you dont need to call  `didMoveToParentViewController` manually.
 
 @param childController The view controller to be added as a child.
 @param viewControllerSubview Which view should childController´s view be added.
 */
- (void)addChildViewController:(UIViewController *)childController intoView:(UIView *)viewControllerSubview;

/** Removes the receiver and its view from its parent view controller and the view´s superview.
 
 @discussion Using this method, you dont need to call  `willMoveToParentViewController` manually.
 */
- (void)removeFromParentViewControllerAndView;

/**
 Lookup an ancestor view controller with given class.

 @return A view controller which is kind of specified ancestor view controller of the the receiver.
 */
- (id)parentViewControllerOfClass:(Class)viewControllerClas;

/** Dismiss keyboard by resign the first responder status.
 
 @discussion You can use this method to dismiss keyboard even the first responder not belong to the reciver.
 */
- (void)dismissKeyboard;

@end
