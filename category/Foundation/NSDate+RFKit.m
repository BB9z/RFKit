
#import "NSDate+RFKit.h"
#import "RFRuntime.h"

@implementation NSDate (RFKit)

+ (nonnull NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents *dc = [[NSDateComponents alloc] init];
    dc.year = year;
    dc.month = month;
    dc.day = day;
    dc.hour = hour;
    dc.minute = minute;
    dc.second = second;
    return (NSDate *__nonnull)[[NSCalendar currentCalendar] dateFromComponents:dc];
}

+ (nonnull NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [NSDate dateWithYear:year month:month day:day hour:0 minute:0 second:0];
}

- (BOOL)isSameDayWithDate:(nullable NSDate *)date {
    if (!date) return NO;

    NSDate *d = date;
    NSDateComponents *target = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:d];
    NSDateComponents *source = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:d];
    return [target isEqual:source];
}

//! ref: http://stackoverflow.com/a/4739650/945906
+ (NSInteger)daysBetweenDate:(nonnull NSDate *)fromDateTime andDate:(nonnull NSDate *)toDateTime {
    NSParameterAssert(fromDateTime != nil);
    NSParameterAssert(toDateTime != nil);
    
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate interval:NULL forDate:toDateTime];
#pragma clang diagnostic pop
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:(NSCalendarOptions)0];
    return difference.day;
}

- (nonnull NSDate *)startTimeOfDate {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    // Date components is always vaild so the return value cannot be nil.
    return (NSDate *__nonnull)[[NSCalendar currentCalendar] dateFromComponents:components];
}

- (nonnull NSDate *)endTimeOfDate {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnit)(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self];
    components.hour = 24;
    components.minute = 0;
    components.second = 0;
    // As this time is actually the start time of the next day. Date components is always vaild so the return value cannot be nil.
    return (NSDate *__nonnull)[[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
