
#import "NSDate+RFKit.h"
#import "RFRuntime.h"

@implementation NSDate (RFKit)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    dc.year = year;
    dc.month = month;
    dc.day = day;
    dc.hour = hour;
    dc.minute = minute;
    dc.second = second;
    return [[NSCalendar currentCalendar] dateFromComponents:dc];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [NSDate dateWithYear:year month:month day:day hour:0 minute:0 second:0];
}

- (BOOL)isSameDayWithDate:(NSDate *)date {
    if (!date) return false;

    NSDateComponents *target = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    NSDateComponents *source = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    return [target isEqual:source];
}

//! ref: http://stackoverflow.com/a/4739650/945906
+ (NSInteger)daysBetweenDate:(NSDate *)fromDateTime andDate:(NSDate *)toDateTime {
    if (!fromDateTime && !toDateTime) return 0;
    NSParameterAssert(fromDateTime != nil);
    NSParameterAssert(toDateTime != nil);
    
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:(NSCalendarOptions)0];
    return difference.day;
}

- (NSDate *)startTimeOfDate {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)endTimeOfDate {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.hour = 24;
    components.minute = 0;
    components.second = 0;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
