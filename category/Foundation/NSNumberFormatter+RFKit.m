
#import "RFRuntime.h"
#import "NSNumberFormatter+RFKit.h"

@implementation NSNumberFormatter (RFKit)

+ (nonnull NSNumberFormatter *)significantFormatterWithMinimumDigits:(NSUInteger)min maximumDigits:(NSUInteger)max {
    
    NSNumberFormatter *significantFormatter = [[NSNumberFormatter alloc] init];
    [significantFormatter setUsesSignificantDigits:YES];
    [significantFormatter setMinimumSignificantDigits:min];
    [significantFormatter setMaximumSignificantDigits:max];
    return significantFormatter;
}

@end
