/*!
    UINavigationController extension
    RFKit

    Copyright (c) 2014 BB9z
    https://github.com/BB9z/RFUI/Core

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UINavigationController (RFKit)

/** Get the previous view controller’s class of the specified view controller in the navigation stack.
 
 @return Returns the previous view controller’s class of the specified view controller.
 */
- (Class)previousViewControllerClassForViewController:(UIViewController *)viewController;


/** Get the previous view controller of the specified view controller in the navigation stack.

 @return Returns the previous view controller of the specified view controller.
 */
- (id)previousViewControllerForViewController:(UIViewController *)viewController;

/** Return whether there is a given kind of view controller in the navigation stack before a view controller.
 
 @return Returns `YES` if there are any view controllers which is kind of given class before the specified view controller; otherwise, `NO`.
 */
- (BOOL)hasViewControllerWithClass:(Class)aClass beforeViewController:(UIViewController *)viewController;

@end
