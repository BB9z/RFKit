/*!
    NSDate extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDate (RFKit)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

- (BOOL)isSameDayWithDate:(NSDate *)date;

/**
 @abstract Returns the number of calendar days between two dates.
 
 @param fromDateTime The start date for the calculation.
 @param toDateTime The end date for the calculation.
 
 @return The number of calendar days between two dates.
 */
+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

@end
