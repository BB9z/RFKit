/*!
    RFMath
    Math and Graphics helper for RFKit
 
    Copyright (c) 2012 BB9z
    http://github.com/bb9z/RFKit
 
    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#ifndef RFKit_RFMath_h
#define RFKit_RFMath_h

#if !defined(RF_INLINE)
#	if defined(CG_INLINE)
#		define RF_INLINE CG_INLINE
#	elif defined(__cplusplus)
#		define RF_INLINE static inline
#	elif defined(__GNUC__)
#		define RF_INLINE static __inline__
#	else
#		define RF_INLINE static
#	endif
#endif

#ifndef RFMathNotChange
#   define RFMathNotChange CGFLOAT_MAX
#endif

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

CGRect CGRectResize(CGRect original, CGSize newSize, RFResizeAnchor resizeAnchor);

// center not changed
RF_INLINE CGRect CGRectScaled(CGRect original, float scale) {
    return CGRectResize(original, CGSizeMake(original.size.width*scale, original.size.height*scale), RFResizeAnchorCenter);
}
CGRect CGRectChange(CGRect original, RFCGRectChangeFlag flag, CGFloat newValue);
bool CGRectIsOutOfRect(CGRect a, CGRect b);


#pragma mark CGAngle
// radian measure
typedef float CGAngle;
CGAngle	CGAngleFromPoints(CGPoint start, CGPoint end);
float	CGAngleDegrees	(CGAngle a);



#endif

