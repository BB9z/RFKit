/*!
 UINavigationController extension
 RFKit
 
 Copyright (c) 2014-2015, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UINavigationController (RFKit)

/**
 The view controller is about to be removed from the view hierarchy.
 */
@property(nullable, readonly) UIViewController *disappearingViewController API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 The view controller just before the `topViewController` in the navigation stack.
 */
@property(nullable, readonly) UIViewController *previousViewController API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Get the previous view controller’s class of the specified view controller in the navigation stack.
 
 @return Returns the previous view controller’s class of the specified view controller.
 */
- (nullable Class)previousViewControllerClassForViewController:(nonnull UIViewController *)viewController API_AVAILABLE(ios(6.0), tvos(9.0));

/**
 Get the previous view controller of the specified view controller in the navigation stack.

 @return Returns the previous view controller of the specified view controller.
 */
- (nullable id)previousViewControllerForViewController:(nonnull UIViewController *)viewController API_AVAILABLE(ios(6.0), tvos(9.0));

/**
 Return whether there is a given kind of view controller in the navigation stack before a view controller.
 
 @param aClass A class object representing the kind of UIViewController to find.
 @param viewController If you specify `nil`, this method searchs all view controllers on the navigation stack reversely.

 @return Returns `YES` if there are any view controllers which is kind of given class before the specified view controller; otherwise, `NO`.
 */
- (BOOL)hasViewControllerWithClass:(nonnull Class)aClass beforeViewController:(nullable UIViewController *)viewController API_AVAILABLE(ios(6.0), tvos(9.0)) NS_SWIFT_NAME( hasViewController(ofKind:before:) );

/**
 Return a view controller which is kind of the specified class in the navigation stack before a view controller.
 
 @param aClass A class object representing the kind of UIViewController to find.
 @param viewController If you specify `nil`, this method searchs all view controllers on the navigation stack reversely.
 */
- (nullable id)viewControllerWithClass:(nonnull Class)aClass beforeViewController:(nullable UIViewController *)viewController API_AVAILABLE(ios(6.0), tvos(9.0)) NS_SWIFT_NAME( viewController(ofKind:before:) );

/**
 Remove the view controller from the navigation stack.
 
 @param vc The view controller to remove. Do nothing if the view controller isn't in the navigation stack.
 @param animated Set this value to YES to animate the transition. Pass NO if you are setting up a navigation controller before its view is displayed.
 */
- (void)removeViewController:(nullable UIViewController *)vc animated:(BOOL)animated API_AVAILABLE(ios(3.0), tvos(9.0)) NS_SWIFT_NAME( removeViewController(_:animated:) );

/**
 Replace the view controller at the top of the navigation stack.

 @param topViewController   Replace the view controller at the top of the navigation stack.
 @param animated    Specify YES to animate the transition or NO if you do not want the transition to be animated. You might specify NO if you are setting up the navigation controller at launch time.
 */
- (void)setTopViewController:(nullable UIViewController *)topViewController animated:(BOOL)animated API_AVAILABLE(ios(3.0), tvos(9.0)) NS_SWIFT_NAME( setTopViewController(_:animated:) );

@end
