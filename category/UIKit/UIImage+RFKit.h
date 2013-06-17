/*!
    UIImage extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

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

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize  DEPRECATED_ATTRIBUTE;
@end
