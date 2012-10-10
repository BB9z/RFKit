
#import "RFKit.h"
#import "NSNumberFormatter+RFKit.h"

@implementation NSNumberFormatter (RFKit)

+ (NSNumberFormatter *)significantFormatterWithMinimumDigits:(NSUInteger)min maximumDigits:(NSUInteger)max {
    
    NSNumberFormatter *significantFormatter = [[NSNumberFormatter alloc] init];
    [significantFormatter setUsesSignificantDigits:YES];
    [significantFormatter setMinimumSignificantDigits:min];
    [significantFormatter setMaximumSignificantDigits:max];
    return RF_AUTORELEASE(significantFormatter);
}

- (NSString *)stringFromFloat:(float)floatVaule {
    return [self stringFromNumber:[NSNumber numberWithFloat:floatVaule]];
}

@end
