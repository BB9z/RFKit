
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

// base on: http://stackoverflow.com/a/2975631/945906
+ (NSString *)formatedFileSizeStringWithBytes:(long long)bytes useBinaryUnites:(BOOL)isBinaryUnites {
    const char units[] = { '\0', 'k', 'M', 'G', 'T' }; // P E Z Y
    int maxUnits = sizeof units - 1;
    
    int multiplier = (isBinaryUnites) ? 1024 : 1000;
    int exponent = 0;
    while (bytes >= multiplier && exponent < maxUnits) {
        bytes /= multiplier;
        exponent++;
    }
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:2];
    
    // Beware of reusing this format string. -[NSString stringWithFormat] ignores \0, *printf does not.
    NSString *formatedString = [NSString stringWithFormat:@"%@ %cB", [formatter stringFromNumber:@(bytes)], units[exponent]];
    RF_RELEASE_OBJ(formatter)
    return formatedString;
}

- (NSString *)stringFromFloat:(float)floatVaule {
    return [self stringFromNumber:[NSNumber numberWithFloat:floatVaule]];
}

@end
