/*!
    NSNumberFormatter extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (RFKit)

+ (NSNumberFormatter *)significantFormatterWithMinimumDigits:(NSUInteger)min maximumDigits:(NSUInteger)max;

/// isBinaryUnites signaling whether to calculate file size in binary units (1024) or base ten units (1000).
+ (NSString *)formatedFileSizeStringWithBytes:(long long)bytes useBinaryUnites:(BOOL)isBinaryUnites;

- (NSString *)stringFromFloat:(float)floatVaule;

@end
