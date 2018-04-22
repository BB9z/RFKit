//
//  UIView+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 22/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RTHelper.h"
#import "UIImage+RFKit.h"
#import "UIView+RFKit.h"


@interface RTUIView : XCTestCase

@end

@implementation RTUIView

- (UIImage *)drawImageWithSizeColor:(CGSize)imageSize fillColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [color set];
    CGContextFillRect(context, CGRectMake(0, 0, imageSize.width, imageSize.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)testRenderToImage {
    UIView *v = [UIView.alloc initWithFrame:CGRectMake(0, 0, 10, 10)];
    v.backgroundColor = UIColor.redColor;
    
    UIImage *image = v.renderToImage;
    XCTAssert(image.size.width >= 10, @"Image should not be empty");
    UIImage *simage1 = [self drawImageWithSizeColor:v.frame.size fillColor:v.backgroundColor];
    XCTAssertTrue(RTImageCompare(image, simage1, 0), @"Image should be red");
    
    v.layer.hidden = YES;
    v.layer.opacity = 0.5;
    UIImage *image2 = v.renderToImage;
    UIImage *simage2 = [self drawImageWithSizeColor:v.frame.size fillColor:UIColor.blackColor];
    XCTAssertTrue(RTImageCompare(image2, simage2, 0), @"Image should be black");
}

@end
