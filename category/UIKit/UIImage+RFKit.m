
#import "RFKit.h"
#import "UIImage+RFKit.h"

@implementation UIImage (RFKit)
+ (UIImage *)resourceName:(NSString *)PNGFileName{
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PNGFileName ofType:@"png"]];
}

+ (UIImage *)resourceName:(NSString *)fileName ofType:(NSString *)type {
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
}

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize {
    return [self imageAspectFillSize:targetSize];
}

//!ref: http://stackoverflow.com/a/605385/945906
- (UIImage *)imageAspectFillSize:(CGSize)targetSize{
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
	
	UIGraphicsBeginImageContext(targetSize);
	[self drawInRect:tmpImageRect];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	if (!newImage) dout_error(@"Resize Image Faile");
	UIGraphicsEndImageContext();
	return newImage;
}

- (UIImage *)imageAspectFitSize:(CGSize)targetSize {
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
	
	UIGraphicsBeginImageContext(targetSize);
	[self drawInRect:tmpImageRect];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	if (!newImage) dout_error(@"Resize Image Faile");
	UIGraphicsEndImageContext();
	return newImage;
}

//!ref: http://stackoverflow.com/a/7704399/945906 
- (UIImage *)imageWithCropRect:(CGRect)rect {
    CGFloat scale = self.scale;
    rect = CGRectMake(rect.origin.x*scale, rect.origin.y*scale, rect.size.width*scale, rect.size.height*scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

- (UIImage*)imageWithScaledSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
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

@end
