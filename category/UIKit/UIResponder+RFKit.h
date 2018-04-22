/*!
 UIResponder extension
 RFKit
 
 Copyright (c) 2014-2015, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UIResponder (RFKit)

/** Traversing the responder chain to get a UIViewController reletive to the receiver.

 @return A view controller. `nil` if cannot find a UIViewController in responder chain.
 */
@property (nullable, readonly) __kindof UIViewController *viewController API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Find current firstResponder through the responder chain.
 */
@property (class, nullable, readonly) __kindof UIResponder *firstResponder API_AVAILABLE(ios(2.0), tvos(9.0)) NS_SWIFT_NAME( firstResponder );

@end
