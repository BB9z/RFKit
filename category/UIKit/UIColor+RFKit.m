
#import "RFKit.h"
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

+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255.0f 
						   green:((hexValue & 0xFF00) >> 8)/255.0f
							blue:(hexValue & 0xFF)/255.0f 
						   alpha:alpha];
}

+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue {
    return [UIColor colorWithRGBHex:hexValue alpha:1.0f];
}


+ (UIColor *)colorWithRGBString:(NSString *)nsstring {
	NSUInteger length = nsstring.length-1;
//	if (length != 3 && length != 6 ) return [UIColor clearColor];
	if (length != 6 ) return [UIColor clearColor];
	if ([nsstring characterAtIndex:0] != '#') return [UIColor clearColor];
	int color;
	sscanf([nsstring UTF8String], "#%x", &color);
	return [UIColor colorWithRGBHex:color];
}

+ (UIColor *)colorWithRGBString:(NSString *)nsstring alpha:(CGFloat)alpha {
	NSUInteger length = nsstring.length-1;
	//	if (length != 3 && length != 6 ) return [UIColor clearColor];
	if (length != 6 ) return [UIColor clearColor]; 
	if ([nsstring characterAtIndex:0] != '#') return [UIColor clearColor];
	int color;
	sscanf([nsstring UTF8String], "#%x", &color);
	return [UIColor colorWithRGBHex:color alpha:alpha];
}

+ (UIColor *)colorWithPatternImageName:(NSString *)resourceName {
	return [UIColor colorWithPatternImage:[UIImage imageNamed:resourceName]];
}

+ (UIColor *)randColorWithAlpha:(CGFloat)alpha {
    BOOL fakeRandom = NO;
    if (fakeRandom) {
        return [UIColor colorWithRed:rand()%255/255.f green:rand()%255/255.f blue:rand()%255/255.f alpha:alpha];
    }
    else {
        return [UIColor colorWithRed:arc4random()%255/255.f green:arc4random()%255/255.f blue:arc4random()%255/255.f alpha:alpha];
    }
}

- (UIColor *)mixedColorWithRatio:(CGFloat)ratio1 color:(UIColor *)color {
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

    CGFloat ratio2 = 1.0f - ratio1;
    CGFloat aratio1 = ratio1 * alpha1;
    CGFloat aratio2 = ratio2 * alpha2;
    CGFloat cratio1 = aratio1 / (aratio1 + aratio2);
    CGFloat cratio2 = aratio2 / (aratio1 + aratio2);

    return [UIColor colorWithRed:red1 * cratio1 + red2 * cratio2 green:green1 * cratio1 + green2 * cratio2 blue:blue1 * cratio1 + blue2 * cratio2 alpha:alpha1 * ratio1 + alpha2 * ratio2];
}

@end
