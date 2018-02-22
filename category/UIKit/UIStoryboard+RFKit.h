/*!
    UIStoryboard extension
    RFKit

    Copyright (c) 2013, 2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UIStoryboard (RFKit)

/**
 Instantiates and returns the view controller with the specified class.
 
 By using this method, you must set view controller stroryboard ID to it's class name.
 */
- (nonnull __kindof UIViewController *)instantiateViewControllerWithIdentifierUsingClass:(nonnull Class)viewControllerClass;
@end
