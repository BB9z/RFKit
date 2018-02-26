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

/**
 Returns a string containing the formatted value of the provided file size.
 
 Deprecated. See NSByteCountFormatter.

 @param bytes The value will be parsed.
 @param isBinaryUnites signaling whether to calculate file size in binary units (1024) or base ten units (1000).

 @return A formated string.
 */
+ (nonnull NSString *)formatedFileSizeStringWithBytes:(long long)bytes useBinaryUnites:(BOOL)isBinaryUnites DEPRECATED_MSG_ATTRIBUTE("Use NSByteCountFormatter instead");

/**
 Returns a string containing the formatted value of the provided float value.

 @param floatVaule A float value that is parsed to create the returned string object.

 @return A string containing the formatted value of number using the receiver’s current settings.
 */
- (nonnull NSString *)stringFromFloat:(float)floatVaule DEPRECATED_ATTRIBUTE;

@end
