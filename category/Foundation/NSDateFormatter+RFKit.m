
#import "RFKit.h"
#import "NSDateFormatter+RFKit.h"

@implementation NSDateFormatter (RFKit)
+ (NSDateFormatter *)GMTFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
		[share setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	}
	return RF_AUTORELEASE([share copy]);
}

+ (NSDateFormatter *)currentLocaleFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
	}
	return RF_AUTORELEASE([share copy]);
}

+ (NSDateFormatter *)currentLocaleFormatterOnlyDate {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd'"];
	}
	return RF_AUTORELEASE([share copy]);
}
@end
