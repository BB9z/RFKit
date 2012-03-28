/*!
	RFMath
	Math and Graphics helper for RFKit
 */



#ifndef RFKit_RFMath_h
#define RFKit_RFMath_h

// radian measure
typedef float CGAngle;

CGPoint	CGPointMid		(CGPoint a, CGPoint b);
float	CGPointDistance	(CGPoint a, CGPoint b);
CGPoint CGPointAtLineRatio(CGPoint start, CGPoint end, CGFloat ratio);
CGPoint CGPointOfRectCenter(CGRect a);

CGSize	CGSizeFromPoints(CGPoint a, CGPoint b);
CGSize	CGSizeScaled	(CGSize original, float scale);

// center not changed
CGRect	CGRectScaled(CGRect original, float scale);

CGAngle	CGAngleFromPoints(CGPoint start, CGPoint end);
float	CGAngleDegrees	(CGAngle a);

#endif
