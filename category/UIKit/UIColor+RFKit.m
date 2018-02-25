
#import "UIColor+RFKit.h"

@implementation UIColor (RFKit)

// These code base on: http://imchao.net/2012/01/08/using-hex-value-with-uicolor/
- (nonnull UIColor *)initWithRGBHex:(int)hexValue alpha:(CGFloat)alpha {
	return [self initWithRed:((hexValue & 0xFF0000) >> 16)/255. green:((hexValue & 0xFF00) >> 8)/255. blue:(hexValue & 0xFF)/255. alpha:alpha];
}

+ (nonnull UIColor *)colorWithRGBHex:(int)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255. green:((hexValue & 0xFF00) >> 8)/255. blue:(hexValue & 0xFF)/255. alpha:alpha];
}

+ (nonnull UIColor *)colorWithRGBHex:(int)hexValue {
    return [UIColor colorWithRGBHex:hexValue alpha:1.];
}

+ (nonnull UIColor *)colorWithRGBString:(nonnull NSString *)nsstring alpha:(CGFloat)alpha {
	NSUInteger length = nsstring.length-1;
	//	if (length != 3 && length != 6 ) return [UIColor clearColor];
	if (length != 6 ) return [UIColor clearColor]; 
	if ([nsstring characterAtIndex:0] != '#') return UIColor.clearColor;
	int color;
	sscanf(nsstring.UTF8String, "#%x", &color);
	return [UIColor colorWithRGBHex:color alpha:alpha];
}

+ (nonnull UIColor *)colorWithRGBString:(nonnull NSString *)nsstring {
    return [UIColor colorWithRGBString:nsstring alpha:1];
}

+ (nullable UIColor *)colorWithPatternImageName:(nonnull NSString *)resourceName {
    UIImage *img = [UIImage imageNamed:resourceName];
    if (!img) return nil;
	return [UIColor colorWithPatternImage:img];
}

+ (nonnull UIColor *)randColorWithAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:arc4random()%255/255. green:arc4random()%255/255. blue:arc4random()%255/255. alpha:alpha];
}

- (nonnull UIColor *)mixedColorWithRatio:(CGFloat)ratio1 color:(nonnull UIColor *)color {
    CGFloat red1;
    CGFloat green1;
    CGFloat blue1;
    CGFloat alpha1;
    [self getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];

    CGFloat red2;
    CGFloat green2;
    CGFloat blue2;
    CGFloat alpha2;
    [color getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];

    CGFloat ratio2 = 1. - ratio1;
    CGFloat aratio1 = ratio1 * alpha1;
    CGFloat aratio2 = ratio2 * alpha2;
    CGFloat cratio1 = aratio1 / (aratio1 + aratio2);
    CGFloat cratio2 = aratio2 / (aratio1 + aratio2);

    return [UIColor colorWithRed:red1 * cratio1 + red2 * cratio2 green:green1 * cratio1 + green2 * cratio2 blue:blue1 * cratio1 + blue2 * cratio2 alpha:alpha1 * ratio1 + alpha2 * ratio2];
}

@end
