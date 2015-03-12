
#import "UIImage+RFKit.h"
#import "RFRuntime.h"

@implementation UIImage (RFKit)
+ (UIImage *)resourceName:(NSString *)PNGFileName{
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PNGFileName ofType:@"png"]];
}

+ (UIImage *)resourceName:(NSString *)fileName ofType:(NSString *)type {
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
}

- (UIImage *)thumbnailImageWithMaxSize:(CGSize)targetSize {
    CGFloat xSource = self.size.width;
    CGFloat ySource = self.size.height;
    CGFloat xTarget = targetSize.width;
    CGFloat yTarget = targetSize.height;
    NSParameterAssert(xTarget > 0 && yTarget > 0);
    if (xSource <= xTarget && ySource <= yTarget) {
        return RF_AUTORELEASE([self copy]);
    }

    CGRect tmpImageRect = CGRectMake(0, 0, xSource, ySource);

    if (xSource/xTarget > ySource/yTarget) {
        tmpImageRect.size.width = xTarget;
        tmpImageRect.size.height = xTarget/xSource*ySource;
    }
    else {
        tmpImageRect.size.height = yTarget;
        tmpImageRect.size.width = yTarget/ySource*xSource;
    }

    UIGraphicsBeginImageContext(tmpImageRect.size);
    [self drawInRect:tmpImageRect];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (!newImage) dout_error(@"Resize Image Faile");
    UIGraphicsEndImageContext();
    return newImage;
}

//!ref: http://stackoverflow.com/a/605385/945906
- (UIImage *)imageAspectFillSize:(CGSize)targetSize opaque:(BOOL)opaque scale:(CGFloat)scale {
	if (CGSizeEqualToSize(self.size, targetSize)) {
		return RF_AUTORELEASE([self copy]);
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
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	if (!newImage) dout_error(@"Resize Image Faile");
	UIGraphicsEndImageContext();
	return newImage;
}

- (UIImage *)imageAspectFillSize:(CGSize)targetSize {
    return [self imageAspectFillSize:targetSize opaque:NO scale:1.0];
}

- (UIImage *)imageAspectFitSize:(CGSize)targetSize opaque:(BOOL)opaque scale:(CGFloat)scale {
    if (CGSizeEqualToSize(self.size, targetSize)) {
		return RF_AUTORELEASE([self copy]);
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
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	if (!newImage) dout_error(@"Resize Image Faile");
	UIGraphicsEndImageContext();
	return newImage;
}

- (UIImage *)imageAspectFitSize:(CGSize)targetSize {
    return [self imageAspectFitSize:targetSize opaque:NO scale:1.0];
}

//!ref: http://stackoverflow.com/a/7704399/945906 
- (UIImage *)imageWithCropRect:(CGRect)rect {
    CGFloat scale = self.scale;
    rect = CGRectApplyAffineTransform(rect, CGAffineTransformMakeScale(scale, scale));
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

- (UIImage*)imageWithScaledSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, self.scale);
    [self drawInRect:(CGRect){CGPointZero, newSize}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (!newImage) dout_error(@"Resize Image Faile");
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage*)imageWithScale:(CGFloat)scale {
    CGSize newSize = CGSizeMake(self.size.width*scale, self.size.height*scale);
    return [self imageWithScaledSize:newSize];
}

#pragma mark - Tint color
- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    CGRect contextBounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    [self drawInRect:contextBounds];
    [tintColor setFill];
    UIRectFillUsingBlendMode(contextBounds, kCGBlendModeSourceAtop);
    
    UIImage *tintImageKeepBright = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintImageKeepBright;
}

- (UIImage *)imageOnlyKeepsAlphaWithTintColor:(UIColor *)tintColor {
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
