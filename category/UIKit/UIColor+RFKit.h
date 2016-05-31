/*!
    UIColor extension
    RFKit

    Copyright (c) 2012-2013, 2015-2016 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UIColor (RFKit)

- (UIColor *_Nonnull)initWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor *_Nonnull)colorWithRGBHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor *_Nonnull)colorWithRGBHex:(NSInteger)hexValue;

+ (UIColor *_Nonnull)colorWithRGBString:(NSString *_Nonnull)nsstring;
+ (UIColor *_Nonnull)colorWithRGBString:(NSString *_Nonnull)nsstring alpha:(CGFloat)alpha;

+ (UIColor *_Nullable)colorWithPatternImageName:(NSString *_Nonnull)resourceName;

+ (UIColor *_Nonnull)randColorWithAlpha:(CGFloat)alpha;

/**
 Creates and returns a mixed color object using the specified mix ratio and color.

 @param ratio Mix ratio of the receiver.
 @param color Another color to mix with the receiver.

 @return The color object.
 */
- (UIColor *_Nonnull)mixedColorWithRatio:(CGFloat)ratio color:(UIColor *_Nonnull)color;
@end
