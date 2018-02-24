/*!
    NSURL extension
    RFKit

    Copyright (c) 2012-2014, 2018 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSURL (RFKit)

/**
 Cover query string into NSDictionary
 */
- (nullable NSDictionary *)queryDictionary API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

@end
