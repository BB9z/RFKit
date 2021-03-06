/*!
 UIImage extension
 RFKit
 
 Copyright (c) 2012-2016, 2018-2019 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UIImage (RFKit)

/**
 Return the dimensions of the image in pixels, taking orientation into account.
 */
@property (readonly) CGSize pixelSize API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0));

/**
 Creat a thumbnail image which it’s width and height not larger than the specified size.
 
 @param targetSize pixel size. Both width and height must be great than zero, or raises an NSInternalInconsistencyException.
 
 @return New copyed image which has same scale with the reciver.
 */
- (nonnull UIImage *)thumbnailImageWithMaxSize:(CGSize)targetSize API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( thumbnailImage(maxSize:) );

/**
 Aspect scale, may crop image
 */
- (nonnull UIImage *)imageAspectFillSize:(CGSize)targetSize opaque:(BOOL)opaque scale:(CGFloat)scale API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( cropedImage(aspectFillSize:opaque:scale:) );

/**
 This method is equivalent to calling the `imageAspectFillSize:opaque:scale:` method with the opaque parameter set to `NO` and a scale factor of `1.0`.
 */
- (nonnull UIImage *)imageAspectFillSize:(CGSize)targetSize API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( cropedImage(aspectFillSize:) );

/**
 Aspect scale, no crop. If opaque is `YES`, the result may has white edges. If opaque is `NO`, the result may has transparent edges.
 */
- (nonnull UIImage *)imageAspectFitSize:(CGSize)targetSize opaque:(BOOL)opaque scale:(CGFloat)scale API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( resizedImage(aspectFitSize:opaque:scale:) );

/**
 This method is equivalent to calling the `imageAspectFitSize:opaque:scale:` method with the opaque parameter set to `NO` and a scale factor of `1.0`.
 */
- (nonnull UIImage *)imageAspectFitSize:(CGSize)targetSize API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( resizedImage(aspectFitSize:) );

/**
 Crop image, no resize
 */
- (nullable UIImage *)imageWithCropRect:(CGRect)rect API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( cropedImage(rect:) );

/**
 Scale image, may change the aspect ratio
 */
- (nonnull UIImage *)imageWithScaledSize:(CGSize)newSize API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( resizedImage(size:) );

/**
 Scale image, keep the aspect ratio
 */
- (nonnull UIImage *)imageWithScale:(CGFloat)scale API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( resizedImage(scale:) );

#pragma mark - Tint color

/**
 Creates and returns an tined image object that uses the specified color object.

 This method preserve the highlights, shadows and alpha of the source image.
 
 @see imageOnlyKeepsAlphaWithTintColor:
 
 @param tintColor A color used to tint the receiver.
 
 @return A tinted image.
*/
- (nonnull UIImage *)rf_imageWithTintColor:(nonnull UIColor *)tintColor API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( tintedImage(color:) );

/**
 Creates and returns an tined image object that uses the specified color object.

 This method only preserve the alpha of the source image.
 
 @see imageWithTintColor:
 
 @param tintColor A color used to tint the receiver.
 
 @return A tinted image.
*/
- (nonnull UIImage *)imageOnlyKeepsAlphaWithTintColor:(nonnull UIColor *)tintColor API_AVAILABLE(ios(4.0), tvos(9.0), watchos(2.0)) NS_SWIFT_NAME( tintedImage(colorKeepsAlpha:) );

@end
