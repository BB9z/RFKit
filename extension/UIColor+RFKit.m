#import "UIColor+RFKit.h"

@implementation UIColor (RFKit)

#pragma mark HexColor
// These code base on: http://imchao.net/2012/01/08/using-hex-value-with-uicolor/
- (UIColor *)initWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
	return [self initWithRed:((hexValue & 0xFF0000) >> 16)/255.0f
					   green:((hexValue & 0xFF00) >> 8)/255.0f
						blue:(hexValue & 0xFF)/255.0f
					   alpha:alpha];
}

+ (UIColor*)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255.0f 
						   green:((hexValue & 0xFF00) >> 8)/255.0f
							blue:(hexValue & 0xFF)/255.0f 
						   alpha:alpha];
}

+ (UIColor*)colorWithHex:(NSInteger)hexValue {
    return [UIColor colorWithRGBHex:hexValue alpha:1.0f];
}



@end
