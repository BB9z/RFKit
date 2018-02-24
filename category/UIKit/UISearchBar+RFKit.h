/*!
    UISearchBar extension
    RFKit

    Copyright (c) 2013, 2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UISearchBar (RFKit)

/**
 Access the cancel button.
 */
@property (nonatomic, nullable, readonly) UIButton *cancelButton API_AVAILABLE(ios(2.0), tvos(9.0));

@end
