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

/**
 Initializes and returns a color object using the specified opacity and RGB component values.
 
 @param hexValue The RGB component value in hex, eg: 0xFFFFFF.
 @param alpha The opacity value of the color object.
 
 @return An initialized color object.
 */
- (nonnull UIColor *)initWithRGBHex:(int)hexValue alpha:(CGFloat)alpha API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a color object using the specified opacity and RGB component values.
 
 @param hexValue The RGB component value in hex, eg: 0xFFFFFF.
 @param alpha The opacity value of the color object.
 
 @return The color object.
 */
+ (nonnull UIColor *)colorWithRGBHex:(int)hexValue alpha:(CGFloat)alpha API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a color object using the specified RGB component values.

 @param hexValue The RGB component value in hex, eg: 0xFFFFFF.
 
 @return The color object.
 */
+ (nonnull UIColor *)colorWithRGBHex:(int)hexValue API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a color object using the specified opacity and RGB component values.

 @param nsstring The RGB component value in hex string, eg: "#FFFFFF".
 @param alpha The opacity value of the color object.
 
 @return The color object.
 */
+ (nonnull UIColor *)colorWithRGBString:(nonnull NSString *)nsstring alpha:(CGFloat)alpha API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a color object using the specified RGB component values.
 
 @param nsstring The RGB component value in hex string, eg: "#FFFFFF".
 
 @return The color object.
 */
+ (nonnull UIColor *)colorWithRGBString:(nonnull NSString *)nsstring API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a color object object using the specified image.
 
 @param resourceName The name of the image file.
 
 @return The color object.
 */
+ (nullable UIColor *)colorWithPatternImageName:(nonnull NSString *)resourceName API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a color object that component values are random with the specified alpha component.
 
 @param alpha The opacity value of the color object.
 
 @return The color object.
 */
+ (nonnull UIColor *)randColorWithAlpha:(CGFloat)alpha API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));

/**
 Creates and returns a mixed color object using the specified mix ratio and color.

 @param ratio Mix ratio of the receiver.
 @param color Another color to mix with the receiver.

 @return The color object.
 */
- (nonnull UIColor *)mixedColorWithRatio:(CGFloat)ratio color:(nonnull UIColor *)color API_AVAILABLE(ios(2.0), tvos(9.0), watchos(2.0));
@end
