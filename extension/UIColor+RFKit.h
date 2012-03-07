/*!
	RFKit
	UIColor extension
 */

@interface UIColor (RFKit)

- (UIColor *)initWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor*)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithRGBHex:(NSInteger)hexValue;

@end
