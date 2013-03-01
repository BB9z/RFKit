/*!
    UIStoryboard extension
    RFKit

    Copyright (c) 2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

@interface UIStoryboard (RFKit)

// By using this method, you must set view controller stroryboard ID to it's class name.
- (id)instantiateViewControllerWithIdentifierUsingClass:(Class)viewControllerClass;
@end
