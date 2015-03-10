/*!
    NSNumberFormatter extension
    RFKit

    Copyright (c) 2012-2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (RFKit)

/** Returns an NSNumberFormatter with specified significant digits config.

 @param min The minimum number of significant digits for the formatter.
 @param max The maximum number of significant digits for the formatter.

 @return An NSNumberFormatter with specified significant digits config.
 */
+ (NSNumberFormatter *)significantFormatterWithMinimumDigits:(NSUInteger)min maximumDigits:(NSUInteger)max;

/** Returns a string containing the formatted value of the provided file size.
 
 Deprecated. See NSByteCountFormatter.

 @param bytes The value will be parsed.
 @param isBinaryUnites signaling whether to calculate file size in binary units (1024) or base ten units (1000).

 @return A formated string.
 */
+ (NSString *)formatedFileSizeStringWithBytes:(long long)bytes useBinaryUnites:(BOOL)isBinaryUnites  DEPRECATED_ATTRIBUTE;

/** Returns a string containing the formatted value of the provided float value.

 @param floatVaule A float value that is parsed to create the returned string object.

 @return A string containing the formatted value of number using the receiver’s current settings.
 */
- (NSString *)stringFromFloat:(float)floatVaule;

@end
