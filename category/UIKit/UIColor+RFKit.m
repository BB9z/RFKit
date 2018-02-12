
#import "UIColor+RFKit.h"

@implementation UIColor (RFKit)

#pragma mark HexColor
// These code base on: http://imchao.net/2012/01/08/using-hex-value-with-uicolor/
- (UIColor *_Nonnull)initWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
	return [self initWithRed:((hexValue & 0xFF0000) >> 16)/255.
					   green:((hexValue & 0xFF00) >> 8)/255.
						blue:(hexValue & 0xFF)/255.
					   alpha:alpha];
}

+ (UIColor *_Nonnull)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255.
						   green:((hexValue & 0xFF00) >> 8)/255.
							blue:(hexValue & 0xFF)/255.
						   alpha:alpha];
}

+ (UIColor *_Nonnull)colorWithRGBHex:(NSInteger)hexValue {
    return [UIColor colorWithRGBHex:hexValue alpha:1.];
}


+ (UIColor *_Nonnull)colorWithRGBString:(NSString *_Nonnull)nsstring {
	NSUInteger length = nsstring.length-1;
//	if (length != 3 && length != 6 ) return [UIColor clearColor];
	if (length != 6 ) return [UIColor clearColor];
	if ([nsstring characterAtIndex:0] != '#') return [UIColor clearColor];
	int color;
	sscanf([nsstring UTF8String], "#%x", &color);
	return [UIColor colorWithRGBHex:color];
}

+ (UIColor *_Nonnull)colorWithRGBString:(NSString *_Nonnull)nsstring alpha:(CGFloat)alpha {
	NSUInteger length = nsstring.length-1;
	//	if (length != 3 && length != 6 ) return [UIColor clearColor];
	if (length != 6 ) return [UIColor clearColor]; 
	if ([nsstring characterAtIndex:0] != '#') return [UIColor clearColor];
	int color;
	sscanf([nsstring UTF8String], "#%x", &color);
	return [UIColor colorWithRGBHex:color alpha:alpha];
}

+ (UIColor *_Nullable)colorWithPatternImageName:(NSString *_Nonnull)resourceName {
    UIImage *img = [UIImage imageNamed:resourceName];
    if (!img) return nil;
	return [UIColor colorWithPatternImage:img];
}

+ (UIColor *_Nonnull)randColorWithAlpha:(CGFloat)alpha {
    BOOL fakeRandom = NO;
    if (fakeRandom) {
        return [UIColor colorWithRed:rand()%255/255. green:rand()%255/255. blue:rand()%255/255. alpha:alpha];
    }
    else {
        return [UIColor colorWithRed:arc4random()%255/255. green:arc4random()%255/255. blue:arc4random()%255/255. alpha:alpha];
    }
}

- (UIColor *_Nonnull)mixedColorWithRatio:(CGFloat)ratio1 color:(UIColor *_Nonnull)color {
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
