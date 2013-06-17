/*!
    NSDateFormatter extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDateFormatter (RFKit)

/** 
 @abstract Returns a date formatter object which has a GMT date format.
 
 @return A cached `NSDateFormatter` object.
 */
+ (NSDateFormatter *)GMTFormatter;

/** 
 @abstract Returns a date formatter object which was set with current locale.
 @discussion The data format is `yyyy'-'MM'-'dd' 'HH':'mm':'ss`.
 
 @return A cached `NSDateFormatter` object.
 
 @see `currentLocaleFormatterOnlyDate`
 */
+ (NSDateFormatter *)currentLocaleFormatter;

/**
 @abstract Returns a date formatter object which was set with current locale.
 @discussion The data format is `yyyy'-'MM'-'dd`.

 @return A cached `NSDateFormatter` object.
 
 @see `currentLocaleFormatter`
 */
+ (NSDateFormatter *)currentLocaleFormatterOnlyDate;


/**
 @abstract Returns a date formatter object with a given date format and a specified time zone.
 
 @param formatString The date format for the receiver. eg. "yyyy'-'MM'-'dd' 'HH':'mm':'ss'".
 @param tzName The ID for the time zone. eg. "GMT", "Pacific/Honolulu", "Asia/Hong_Kong".
 
 @return A `NSDateFormatter` object.
 */
+ (NSDateFormatter *)dateFormatterWithDateFormat:(NSString *)formatString timeZoneWithName:(NSString *)tzName;

/** 
 @abstract Returns a date formatter object with Asia/Hong_Kong time zone.
 
 @return A cached `NSDateFormatter` object.
 
 @see `dateFormatterWithDateFormat:timeZoneWithName:`
 */
+ (NSDateFormatter *)hongKongTimeZoneDateFormatter;

@end
