/*!
    UIResponder extension
    RFKit

    Copyright (c) 2014-2015 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UIResponder (RFKit)

/** Traversing the responder chain to get a UIViewController reletive to the receiver.

 @return A view controller. `nil` if cannot find a UIViewController in responder chain.
 */
- (id)viewController;

/**
 Find current firstResponder through the responder chain.
 */
+ (id)firstResponder;

@end
