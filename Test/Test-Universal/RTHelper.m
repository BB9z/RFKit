//
//  RTHelper.m
//  RFKit
//
//  Created by BB9z on 22/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import "RTHelper.h"

@implementation RTHelper

@end

#if TARGET_OS_OSX

#else

#import "UIImage+RFKit.h"

// This makes debugging much more fun
typedef union {
    uint32_t raw;
    unsigned char bytes[4];
    struct {
        char red;
        char green;
        char blue;
        char alpha;
    } __attribute__ ((packed)) pixels;
} FBComparePixel;

//! REF: https://github.com/uber/ios-snapshot-test-case/blob/master/FBSnapshotTestCase/Categories/UIImage%2BCompare.m
BOOL RTImageCompare(UIImage *a, UIImage *b, double tolerance) {
    NSCAssert(CGSizeEqualToSize(a.size, b.size), @"Images must be same size.");
    
    CGSize aSize = a.pixelSize;
    CGSize bSize = b.pixelSize;
    CGImageRef aImage = a.CGImage;
    CGImageRef bImage = b.CGImage;
    
    // The images have the equal size, so we could use the smallest amount of bytes because of byte padding
    size_t minBytesPerRow = MIN(CGImageGetBytesPerRow(aImage), CGImageGetBytesPerRow(bImage));
    size_t referenceImageSizeBytes = aSize.height * minBytesPerRow;
    
    void *aPixels = calloc(1, referenceImageSizeBytes);
    void *bPixels = calloc(1, referenceImageSizeBytes);
    if (!aPixels || !bPixels) {
        free(aPixels);
        free(bPixels);
        return NO;
    }
    
    CGContextRef aContext = CGBitmapContextCreate(aPixels, aSize.width, aSize.height, CGImageGetBitsPerComponent(aImage), minBytesPerRow, CGImageGetColorSpace(aImage), (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    CGContextRef bContext = CGBitmapContextCreate(bPixels, bSize.width, bSize.height, CGImageGetBitsPerComponent(bImage), minBytesPerRow, CGImageGetColorSpace(bImage), (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
    
    if (!aContext || !bContext) {
        CGContextRelease(aContext);
        CGContextRelease(bContext);
        free(aPixels);
        free(bPixels);
        return NO;
    }
    
    CGContextDrawImage(aContext, CGRectMake(0, 0, aSize.width, aSize.height), a.CGImage);
    CGContextDrawImage(bContext, CGRectMake(0, 0, bSize.width, bSize.height), b.CGImage);
    CGContextRelease(aContext);
    CGContextRelease(bContext);
    
    BOOL imageEqual = YES;
    
    // Do a fast compare if we can
    if (tolerance == 0) {
        imageEqual = (memcmp(aPixels, bPixels, referenceImageSizeBytes) == 0);
    }
    else {
        // Go through each pixel in turn and see if it is different
        const long pixelCount = aSize.width * aSize.height;
        
        FBComparePixel *p1 = aPixels;
        FBComparePixel *p2 = bPixels;
        
        long numDiffPixels = 0;
        for (int n = 0; n < pixelCount; ++n) {
            // If this pixel is different, increment the pixel diff count and see
            // if we have hit our limit.
            if (p1->raw != p2->raw) {
                numDiffPixels ++;
                
                double percent = (double)numDiffPixels / pixelCount;
                if (percent > tolerance) {
                    imageEqual = NO;
                    break;
                }
            }
            
            p1++;
            p2++;
        }
    }
    
    free(aPixels);
    free(bPixels);
    
    return imageEqual;
}

#endif // END: TARGET_OS_OSX
