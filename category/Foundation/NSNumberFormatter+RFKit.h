/*!
    NSNumberFormatter extension
    RFKit

    Copyright (c) 2012-2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSNumberFormatter (RFKit)

/**
 Returns an NSNumberFormatter with specified significant digits config.

 @param min The minimum number of significant digits for the formatter.
 @param max The maximum number of significant digits for the formatter.

 @return An NSNumberFormatter with specified significant digits config.
 */
+ (nonnull NSNumberFormatter *)significantFormatterWithMinimumDigits:(NSUInteger)min maximumDigits:(NSUInteger)max API_AVAILABLE(macos(10.5), ios(2.0), tvos(9.0), watchos(2.0));

@end
