
#import "NSDateFormatter+RFKit.h"

@implementation NSDateFormatter (RFKit)

+ (nonnull NSDateFormatter *)GMTFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
        share.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
        share.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
	}
	return [share copy];
}

+ (nonnull NSDateFormatter *)currentLocaleFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss"];
	}
	return [share copy];
}

+ (nonnull NSDateFormatter *)currentLocaleFormatterOnlyDate {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd"];
	}
	return [share copy];
}

+ (nonnull NSDateFormatter *)currentLocaleFormatterFromTemplate:(nonnull NSString *)template {
    NSString *format = [NSDateFormatter dateFormatFromTemplate:template options:0 locale:[NSLocale currentLocale]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    return formatter;
}

+ (nonnull NSDateFormatter *)dateFormatterWithDateFormat:(nullable NSString *)formatString timeZoneWithName:(nullable NSString *)timezoneName {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (timezoneName) {
        NSString *tzName = timezoneName;
        [formatter setTimeZone:[NSTimeZone timeZoneWithName:tzName]];
    }
    [formatter setDateFormat:formatString];
    return formatter;
}

+ (NSDateFormatter *)hongKongTimeZoneDateFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [NSDateFormatter dateFormatterWithDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss" timeZoneWithName:@"Asia/Hong_Kong"];
	}
	return [share copy];
}

@end
