/*!
    UIViewController extension
    RFKit

    Copyright (c) 2012-2013, 2015-2016 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UIViewController (RFKit)

/**
 Returns a Boolean value indicating whether the view is added to a view hierarchy.
 */
- (BOOL)isViewAppeared;

/** Return a view which can present another view controller.
 
 @discussion First we get an window´s root view controller. Then  traverse its presentedViewController property until the presentedViewController property is nil.
 
 @return A view controller which can present another view controller.
 */
+ (nullable UIViewController *)rootViewControllerWhichCanPresentModalViewController;

/** Adds the given view controller as a child and add its view to specified view as a subview.
 
 @discussion Using this method, you dont need to call  `didMoveToParentViewController` manually.
 
 @param childController The view controller to be added as a child.
 @param viewControllerSubview Which view should childController´s view be added.
 */
- (void)addChildViewController:(nonnull UIViewController *)childController intoView:(nullable UIView *)viewControllerSubview;

/** Removes the receiver and its view from its parent view controller and the view´s superview.
 
 @discussion Using this method, you dont need to call  `willMoveToParentViewController` manually.
 */
- (void)removeFromParentViewControllerAndView;

/**
 Lookup an ancestor view controller with given class.

 @return A view controller which is kind of specified ancestor view controller of the the receiver.
 */
- (nullable id)parentViewControllerOfClass:(nonnull Class)viewControllerClas;

/** Dismiss keyboard by resign the first responder status.
 
 @discussion You can use this method to dismiss keyboard even the first responder not belong to the reciver.
 */
- (void)dismissKeyboard;

@end
