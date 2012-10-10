/*!
    RFKit
    NSNumberFormatter extension

    Copyright (c) 2012 BB9z
    http://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (RFKit)

+ (NSNumberFormatter *)significantFormatterWithMinimumDigits:(NSUInteger)min maximumDigits:(NSUInteger)max;
- (NSString *)stringFromFloat:(float)floatVaule;

@end
