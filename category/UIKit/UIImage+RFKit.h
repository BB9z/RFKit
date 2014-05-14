/*!
    UIImage extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

@interface UIImage (RFKit)
+ (UIImage *)resourceName:(NSString *)PNGFileName;
+ (UIImage *)resourceName:(NSString *)fileName ofType:(NSString *)type;

// Aspect scale, may crop image
- (UIImage *)imageAspectFillSize:(CGSize)targetSize;

// Aspect scale, no crop
- (UIImage *)imageAspectFitSize:(CGSize)targetSize;

// Crop image, no resize
- (UIImage *)imageWithCropRect:(CGRect)rect;

// Scale image, may change the aspect ratio
- (UIImage *)imageWithScaledSize:(CGSize)newSize;

// Scale image, keep the aspect ratio
- (UIImage*)imageWithScale:(CGFloat)scale;

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize DEPRECATED_ATTRIBUTE;

#pragma mark - Tint color
/// @name Tint color

/** Creates and returns an tined image object that uses the specified color object.

 This method preserve the highlights, shadows and alpha of the source image.
 
 @see imageOnlyKeepsAlphaWithTintColor:
 
 @param tintColor A color used to tint the receiver.
 
 @return A tinted image.
*/
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

/** Creates and returns an tined image object that uses the specified color object.

 This method only preserve the alpha of the source image.
 
 @see imageWithTintColor:
 
 @param tintColor A color used to tint the receiver.
 
 @return A tinted image.
*/
- (UIImage *)imageOnlyKeepsAlphaWithTintColor:(UIColor *)tintColor;


@end
