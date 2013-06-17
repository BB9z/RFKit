/*!
    RFGeometry
    RFKit
 
    Math and Graphics helper
 
    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit
 
    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

#ifndef _RFKit_RFGeometry_h_
#define _RFKit_RFGeometry_h_

#pragma mark - Const
#ifndef RFMathNotChange
#   define RFMathNotChange CGFLOAT_MAX
#endif

extern const CGPoint CGPointNotChange;
extern const CGRect  CGRectNotChange;
extern const CGSize  CGSizeNotChange;

#pragma mark - Anchor
typedef enum {
	RFResizeAnchorCenter = 0,
    RFResizeAnchorTop,
    RFResizeAnchorBottom,
    RFResizeAnchorLeft,
    RFResizeAnchorRight,
    RFResizeAnchorTopLeft,
    RFResizeAnchorTopRight,
    RFResizeAnchorBottomLeft,
    RFResizeAnchorBottomRight,
} RFResizeAnchor;

typedef enum {
	RFAlignmentAnchorCenter = 0,
    RFAlignmentAnchorTop,
    RFAlignmentAnchorBottom,
    RFAlignmentAnchorLeft,
    RFAlignmentAnchorRight,
    RFAlignmentAnchorTopLeft,
    RFAlignmentAnchorTopRight,
    RFAlignmentAnchorBottomLeft,
    RFAlignmentAnchorBottomRight,
} RFAlignmentAnchor;

#pragma mark -
#pragma mark CGPoint
CGPoint	CGPointMid		(CGPoint a, CGPoint b);
float	CGPointDistance	(CGPoint a, CGPoint b);
CGPoint CGPointAtLineRatio(CGPoint start, CGPoint end, CGFloat ratio);
CGPoint CGPointOfRectCenter(CGRect a);


#pragma mark CGSize
CGSize	CGSizeFromPoints(CGPoint a, CGPoint b);
CGSize	CGSizeScaled	(CGSize original, float scale);


#pragma mark CGRect
typedef enum {
	RFCGRectChangeX = 0,
	RFCGRectChangeY,
	RFCGRectChangeWidth,
	RFCGRectChangeHeight
} RFCGRectChangeFlag;

CGRect CGRectMakeWithPoints(CGPoint a, CGPoint b);
CGRect CGRectMakeWithCenterAndSize(CGPoint centerPoint, CGSize rectSize);

CGRect CGRectResize(CGRect original, CGSize newSize, RFResizeAnchor resizeAnchor);

// center not changed
CG_INLINE CGRect CGRectScaled(CGRect original, float scale) {
    return CGRectResize(original, CGSizeMake(original.size.width*scale, original.size.height*scale), RFResizeAnchorCenter);
}
CGRect CGRectChange(CGRect original, RFCGRectChangeFlag flag, CGFloat newValue);

#pragma mark CGAngle
// radian measure
typedef float CGAngle;
CGAngle	CGAngleFromPoints(CGPoint start, CGPoint end);
float	CGAngleDegrees	(CGAngle a);


#endif
