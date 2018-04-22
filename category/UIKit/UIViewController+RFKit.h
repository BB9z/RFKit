/*!
 UIViewController extension
 RFKit
 
 Copyright (c) 2012-2013, 2015-2016, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UIViewController (RFKit)

/**
 Returns a Boolean value indicating whether the view is added to a view hierarchy.
 */
@property (readonly) BOOL isViewAppeared API_AVAILABLE(ios(3.0), tvos(9.0));

/**
 Return a view which can present another view controller.
 
 First we get an window´s root view controller. Then  traverse its presentedViewController property until the presentedViewController property is nil.
 
 @return A view controller which can present another view controller.
 */
+ (nullable UIViewController *)rootViewControllerWhichCanPresentModalViewController API_AVAILABLE(ios(4.0), tvos(9.0));

/**
 Adds the given view controller as a child and add its view to specified view as a subview.
 
 Using this method, you dont need to call  `didMoveToParentViewController` manually.
 
 @param childController The view controller to be added as a child.
 @param viewControllerSubview Which view should childController´s view be added.
 */
- (void)addChildViewController:(nonnull UIViewController *)childController intoView:(nullable UIView *)viewControllerSubview API_AVAILABLE(ios(5.0), tvos(9.0));

/**
 Removes the receiver and its view from its parent view controller and the view´s superview.
 
 Using this method, you dont need to call  `willMoveToParentViewController` manually.
 */
- (void)removeFromParentViewControllerAndView API_AVAILABLE(ios(5.0), tvos(9.0));

/**
 Lookup an ancestor view controller with given class.

 @return A view controller which is kind of specified ancestor view controller of the the receiver.
 */
- (nullable id)parentViewControllerOfClass:(nonnull Class)viewControllerClas API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Dismiss keyboard by resign the first responder status.
 
 You can use this method to dismiss keyboard even the first responder not belong to the reciver.
 */
- (void)dismissKeyboard API_AVAILABLE(ios(2.0), tvos(9.0));

@end
