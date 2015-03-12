/*!
    NSDate extension
    RFKit

    Copyright (c) 2012-2013, 2015 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDate (RFKit)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/** Returns a Boolean value that indicates whether the receiver and a given date object are the same day.
 
 @param date The date object to be compared to the receiver.
 
 @return `YES` if the receiver and anObject are the same day, otherwise `NO`.
 */
- (BOOL)isSameDayWithDate:(NSDate *)date;

/** Returns the number of calendar days between two dates.
 
 @param fromDateTime The start date for the calculation.
 @param toDateTime The end date for the calculation.
 
 @return The number of calendar days between two dates.
 */
+ (NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime;

- (NSDate *)startTimeOfDate;
- (NSDate *)endTimeOfDate;
@end
