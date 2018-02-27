
#import "UIImage+RFKit.h"
#import "RFGeometry.h"

@implementation UIImage (RFKit)

- (CGSize)pixelSize {
    return CGSizeScaled(self.size, self.scale);
}

- (nonnull UIImage *)thumbnailImageWithMaxSize:(CGSize)targetSize {
    CGFloat scale = self.scale;
    CGFloat wSource = self.size.width * scale;
    CGFloat hSource = self.size.height * scale;
    CGFloat wTarget = targetSize.width;
    CGFloat hTarget = targetSize.height;
    NSParameterAssert(wTarget > 0 && hTarget > 0);
    if (wSource <= wTarget && hSource <= hTarget) {
        return [self copy];
    }

    CGRect pixelFrame = (CGRect){ CGPointZero, { wSource, hSource} };
    if (wSource/wTarget > hSource/hTarget) {
        pixelFrame.size.width = wTarget;
        pixelFrame.size.height = wTarget/wSource * hSource;
    }
    else {
        pixelFrame.size.height = hTarget;
        pixelFrame.size.width = hTarget/hSource * wSource;
    }
    pixelFrame = CGRectIntegral(pixelFrame);

    CGRect drawRect = CGRectScaled(pixelFrame, 1./scale);
    UIGraphicsBeginImageContextWithOptions(drawRect.size, NO, scale);
    [self drawInRect:drawRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//!ref: http://stackoverflow.com/a/605385/945906
- (nonnull UIImage *)imageAspectFillSize:(CGSize)targetSize opaque:(BOOL)opaque scale:(CGFloat)scale {
	if (CGSizeEqualToSize(self.size, targetSize)) {
		return [self copy];
	}
	
	CGFloat xSource = self.size.width;
	CGFloat ySource = self.size.height;
	CGFloat xTarget = targetSize.width;
	CGFloat yTarget = targetSize.height;
	CGRect tmpImageRect = CGRectMake(0, 0, xSource, ySource);
	CGFloat factor;
	
	if (xSource/ySource > xTarget/yTarget) {
		// 图像按高适配
		factor = yTarget/ySource;
		tmpImageRect.size.width = xSource*factor;
		tmpImageRect.size.height = yTarget;
		tmpImageRect.origin.x = (xTarget -tmpImageRect.size.width)/2;
	}
	else {
		// 图像按宽度适配
		factor = xTarget/xSource;
		tmpImageRect.size.height = ySource*factor;
		tmpImageRect.size.width = xTarget;
		tmpImageRect.origin.y = (yTarget - tmpImageRect.size.height)/2;
	}
	
    UIGraphicsBeginImageContextWithOptions(targetSize, opaque, scale);
	[self drawInRect:tmpImageRect];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

- (nonnull UIImage *)imageAspectFillSize:(CGSize)targetSize {
    return [self imageAspectFillSize:targetSize opaque:NO scale:1.0];
}

- (nonnull UIImage *)imageAspectFitSize:(CGSize)targetSize opaque:(BOOL)opaque scale:(CGFloat)scale {
    if (CGSizeEqualToSize(self.size, targetSize)) {
		return [self copy];
	}
	
	CGFloat xSource = self.size.width;
	CGFloat ySource = self.size.height;
	CGFloat xTarget = targetSize.width;
	CGFloat yTarget = targetSize.height;
	CGRect tmpImageRect = CGRectMake(0, 0, xSource, ySource);
	CGFloat factor;
	
	if (xSource/ySource > xTarget/yTarget) {
        // 图像按宽度适配
        factor = xTarget/xSource;
        tmpImageRect.size.height = ySource*factor;
        tmpImageRect.size.width = xTarget;
        tmpImageRect.origin.y = (yTarget - tmpImageRect.size.height)/2;
	}
	else {
        // 图像按高适配
        factor = yTarget/ySource;
        tmpImageRect.size.width = xSource*factor;
        tmpImageRect.size.height = yTarget;
        tmpImageRect.origin.x = (xTarget -tmpImageRect.size.width)/2;
	}
	
    UIGraphicsBeginImageContextWithOptions(targetSize, opaque, scale);
	[self drawInRect:tmpImageRect];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

- (nonnull UIImage *)imageAspectFitSize:(CGSize)targetSize {
    return [self imageAspectFitSize:targetSize opaque:NO scale:1.0];
}

//!ref: http://stackoverflow.com/a/7704399/945906 
- (nullable UIImage *)imageWithCropRect:(CGRect)rect {
    CGFloat scale = self.scale;
    rect = CGRectApplyAffineTransform(rect, CGAffineTransformMakeScale(scale, scale));
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

- (nonnull UIImage*)imageWithScaledSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, self.scale);
    [self drawInRect:(CGRect){CGPointZero, newSize}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (nonnull UIImage*)imageWithScale:(CGFloat)scale {
    CGSize newSize = CGSizeMake(self.size.width*scale, self.size.height*scale);
    return [self imageWithScaledSize:newSize];
}

#pragma mark - Tint color

- (nonnull UIImage *)imageWithTintColor:(nonnull UIColor *)tintColor {
    CGRect contextBounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    [self drawInRect:contextBounds];
    [tintColor setFill];
    UIRectFillUsingBlendMode(contextBounds, kCGBlendModeSourceAtop);
    
    UIImage *tintImageKeepBright = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintImageKeepBright;
}

- (nonnull UIImage *)imageOnlyKeepsAlphaWithTintColor:(UIColor *)tintColor {
    CGRect contextBounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    [self drawInRect:contextBounds];
    [tintColor setFill];
    UIRectFillUsingBlendMode(contextBounds, kCGBlendModeSourceIn);
    
    UIImage *tintImageKeepAlpha = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintImageKeepAlpha;
}

@end
