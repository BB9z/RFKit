/*!
    UIColor extension
    RFKit

    Copyright (c) 2012-2013, 2015-2016, 2018 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UIColor (RFKit)

- (nonnull UIColor *)initWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (nonnull UIColor *)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (nonnull UIColor *)colorWithRGBHex:(NSInteger)hexValue;

+ (nonnull UIColor *)colorWithRGBString:(nonnull NSString *)nsstring;
+ (nonnull UIColor *)colorWithRGBString:(nonnull NSString *)nsstring alpha:(CGFloat)alpha;

+ (nullable UIColor *)colorWithPatternImageName:(nonnull NSString *)resourceName;

+ (nonnull UIColor *)randColorWithAlpha:(CGFloat)alpha;

/**
 Creates and returns a mixed color object using the specified mix ratio and color.

 @param ratio Mix ratio of the receiver.
 @param color Another color to mix with the receiver.

 @return The color object.
 */
- (nonnull UIColor *)mixedColorWithRatio:(CGFloat)ratio color:(nonnull UIColor *)color;
@end
