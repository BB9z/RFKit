/*!
	RFMath
	Math and Graphics helper for RFKit
 */


#ifndef RFKit_RFMath_h
#define RFKit_RFMath_h

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

// center not changed
CGRect	CGRectScaled(CGRect original, float scale);
CGRect CGRectChange(CGRect original, RFCGRectChangeFlag flag, CGFloat newValue);
bool CGRectIsOutOfRect(CGRect a, CGRect b);


#pragma mark CGAngle
// radian measure
typedef float CGAngle;
CGAngle	CGAngleFromPoints(CGPoint start, CGPoint end);
float	CGAngleDegrees	(CGAngle a);

#endif

