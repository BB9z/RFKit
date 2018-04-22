/*!
    NSDateFormatter extension
    RFKit

    Copyright (c) 2012-2015, 2018 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSDateFormatter (RFKit)

/**
 Returns a date formatter object which has a GMT date format.
 
 eg. 2010-01-01T23:00:59Z
 
 @return A cached `NSDateFormatter` object.
 */
+ (nonnull NSDateFormatter *)GMTFormatter API_AVAILABLE(macos(10.0), ios(2.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( GMT() );

/**
 Returns a date formatter object which was set with current locale.

 The date format is `yyyy'-'MM'-'dd' 'HH':'mm':'ss`.
 
 @return A cached `NSDateFormatter` object.
 
 @see `currentLocaleFormatterOnlyDate`
 */
+ (nonnull NSDateFormatter *)currentLocaleFormatter API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0));

/**
 Returns a date formatter object which was set with current locale.

 The date format is `yyyy'-'MM'-'dd`.

 @return A cached `NSDateFormatter` object.
 
 @see `currentLocaleFormatter`
 */
+ (nonnull NSDateFormatter *)currentLocaleFormatterOnlyDate API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( currentLocaleOnlyDate() );

/**
 Returns a date formatter object which was set with current locale.
 
 The date format is also localized.

 @param templateString A string containing date format patterns (such as “MM” or “h”).
 
 @return A `NSDateFormatter` object.
 */
+ (nonnull NSDateFormatter *)currentLocaleFormatterFromTemplate:(nonnull NSString *)templateString API_AVAILABLE(macos(10.6), ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( currentLocale(fromTemplate:) );

/**
 Returns a date formatter object with a given date format and a specified time zone.
 
 @param formatString The date format for the receiver. eg. "yyyy'-'MM'-'dd' 'HH':'mm':'ss'".
 @param tzName The ID for the time zone. eg. "GMT", "Pacific/Honolulu", "Asia/Hong_Kong". If you specify `nil` or invaild name, the system time zone is used.
 
 @return A `NSDateFormatter` object.
 */
+ (nonnull NSDateFormatter *)dateFormatterWithDateFormat:(nullable NSString *)formatString timeZoneWithName:(nullable NSString *)tzName API_AVAILABLE(macos(10.0), ios(2.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( init(format:timeZoneName:) );

/**
 Returns a date formatter object with Asia/Hong_Kong time zone.
 
 The date format is `yyyy'-'MM'-'dd' 'HH':'mm':'ss`.
 
 @return A cached `NSDateFormatter` object.
 
 @see `dateFormatterWithDateFormat:timeZoneWithName:`
 */
+ (nonnull NSDateFormatter *)hongKongTimeZoneDateFormatter API_AVAILABLE(macos(10.0), ios(2.0), tvos(9.0), watchos(2.0));

@end
