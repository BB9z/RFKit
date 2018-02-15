/*!
    NSDateFormatter extension
    RFKit

    Copyright (c) 2012-2015, 2018 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDateFormatter (RFKit)

/**
 Returns a date formatter object which has a GMT date format.
 
 @return A cached `NSDateFormatter` object.
 */
+ (nonnull NSDateFormatter *)GMTFormatter;

/**
 Returns a date formatter object which was set with current locale.

 The date format is `yyyy'-'MM'-'dd' 'HH':'mm':'ss`.
 
 @return A cached `NSDateFormatter` object.
 
 @see `currentLocaleFormatterOnlyDate`
 */
+ (nonnull NSDateFormatter *)currentLocaleFormatter;

/**
 Returns a date formatter object which was set with current locale.

 The date format is `yyyy'-'MM'-'dd`.

 @return A cached `NSDateFormatter` object.
 
 @see `currentLocaleFormatter`
 */
+ (nonnull NSDateFormatter *)currentLocaleFormatterOnlyDate;

/**
 Returns a date formatter object which was set with current locale.
 
 The date format is also localized.

 @param templateString A string containing date format patterns (such as “MM” or “h”).
 
 @return A `NSDateFormatter` object.
 */
+ (nonnull NSDateFormatter *)currentLocaleFormatterFromTemplate:(nullable NSString *)templateString;

/**
 Returns a date formatter object with a given date format and a specified time zone.
 
 @param formatString The date format for the receiver. eg. "yyyy'-'MM'-'dd' 'HH':'mm':'ss'".
 @param tzName The ID for the time zone. eg. "GMT", "Pacific/Honolulu", "Asia/Hong_Kong". If you specify `nil` or invaild name, the system time zone is used.
 
 @return A `NSDateFormatter` object.
 */
+ (nonnull NSDateFormatter *)dateFormatterWithDateFormat:(nullable NSString *)formatString timeZoneWithName:(nullable NSString *)tzName;

/**
 Returns a date formatter object with Asia/Hong_Kong time zone.
 
 The date format is `yyyy'-'MM'-'dd' 'HH':'mm':'ss`.
 
 @return A cached `NSDateFormatter` object.
 
 @see `dateFormatterWithDateFormat:timeZoneWithName:`
 */
+ (nonnull NSDateFormatter *)hongKongTimeZoneDateFormatter;

@end
