/*!
	RFKit
	UIColor extension
 */

@interface UIColor (RFKit)

- (UIColor *)initWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor*)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor*)colorWithRGBHex:(NSInteger)hexValue;

+ (UIColor *)colorWithRGBString:(NSString *)nsstring;
+ (UIColor *)colorWithRGBString:(NSString *)nsstring alpha:(CGFloat)alpha;
@end
