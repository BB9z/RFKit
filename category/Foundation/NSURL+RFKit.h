/*!
 NSURL extension
 RFKit
 
 Copyright (c) 2012-2014, 2018-2019 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSURL (RFKit)

/**
 Cover query string into NSDictionary
 */
@property (nullable, readonly) NSDictionary *queryDictionary API_AVAILABLE(macos(10.9), ios(7.0), tvos(9.0), watchos(2.0));

@end
