/*!
 NSDate extension
 RFKit
 
 Copyright (c) 2012-2016, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSDate (RFKit)

/**
 Returns a date representing the absolute time calculated from given components of current time zone.
 */
+ (nonnull NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0));

/**
 Returns a date representing the absolute time calculated from given components of current time zone.
 
 @see dateWithYear:month:day:hour:minute:second:
 */
+ (nonnull NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0));

/**
 Returns a Boolean value that indicates whether the receiver and a given date object are the same day.
 
 @param date The date object to be compared to the receiver.
 
 @return `YES` if the receiver and anObject are the same day, otherwise `NO`.
 */
- (BOOL)isSameDayWithDate:(nullable NSDate *)date API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0));

/**
 Returns the number of calendar days between two dates.
 
 @param fromDateTime The start date for the calculation. This value must not be `nil` or an `NSInvalidArgumentException` will be thrown.
 @param toDateTime The end date for the calculation. This value must not be `nil` or an `NSInvalidArgumentException` will be thrown.
 
 @return The number of calendar days between two dates.
 */
+ (NSInteger)daysBetweenDate:(nonnull NSDate *)fromDateTime andDate:(nonnull NSDate *)toDateTime API_AVAILABLE(macos(10.5), ios(2.0), tvos(9.0), watchos(2.0));

/**
 Returns a date object at 00:00:00 of current day.
 */
@property (nonnull, readonly) NSDate *startTimeOfDate API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( dayStart );

/**
 Returns a date object at 24:00:00 of current day. This date is actually the start time of the next day.
 */
@property (nonnull, readonly) NSDate *endTimeOfDate API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( dayEnd );
@end
