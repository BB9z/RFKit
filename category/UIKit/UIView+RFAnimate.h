/*!
    Animation extension for UIView
    RFKit

    Copyright (c) 2014-2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

/**
 These properties all support KVO.
 */
@interface UIView (RFAnimate)
@property (nonatomic) CGFloat x API_AVAILABLE(ios(2.0), tvos(9.0));
@property (nonatomic) CGFloat y API_AVAILABLE(ios(2.0), tvos(9.0));
@property (nonatomic) CGFloat rightMargin API_AVAILABLE(ios(2.0), tvos(9.0));
@property (nonatomic) CGFloat bottomMargin API_AVAILABLE(ios(2.0), tvos(9.0));

@property (nonatomic) CGFloat width API_AVAILABLE(ios(2.0), tvos(9.0));
@property (nonatomic) CGFloat height API_AVAILABLE(ios(2.0), tvos(9.0));
@property (nonatomic) CGSize size API_AVAILABLE(ios(2.0), tvos(9.0));

@end
