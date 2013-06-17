#import "RFKit.h"
#import "RFGeometry.h"
#import <stdio.h>

const CGPoint CGPointNotChange = {RFMathNotChange, RFMathNotChange};
const CGRect  CGRectNotChange  = {{RFMathNotChange, RFMathNotChange}, {RFMathNotChange, RFMathNotChange}};
const CGSize  CGSizeNotChange  = {RFMathNotChange, RFMathNotChange};

#pragma mark CGPoint
CGPoint CGPointMid(CGPoint a, CGPoint b) {
	return CGPointMake((a.x+b.x)/2, (a.y+b.y)/2);
}
float CGPointDistance(CGPoint a, CGPoint b) {
	return (float)sqrt((a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y));
}
CGPoint CGPointAtLineRatio(CGPoint start, CGPoint end, CGFloat ratio) {
	return CGPointMake(start.x + (end.x-start.x)*ratio, start.y + (end.y-start.y)*ratio);
}
CGPoint CGPointOfRectCenter(CGRect a) {
	return CGPointMake((a.origin.x+a.size.width)/2, (a.origin.y+a.size.height)/2);
}


#pragma mark CGSize
CGSize CGSizeFromPoints(CGPoint start, CGPoint end) {
	return CGSizeMake(end.x-start.x, end.y-start.y);
}
CGSize CGSizeScaled(CGSize original, float scale) {
	return CGSizeMake(original.width*scale, original.height*scale);
}


#pragma mark CGRect
CGRect CGRectMakeWithPoints(CGPoint a, CGPoint b) {
    CGFloat x = fminf(a.x, b.x);
    CGFloat y = fminf(a.y, b.y);
    CGFloat width = fabsf(a.x-b.x);
    CGFloat height = fabsf(a.y-b.y);
    return CGRectMake(x, y, width, height);
}

CGRect CGRectMakeWithCenterAndSize(CGPoint centerPoint, CGSize rectSize) {
    CGFloat x = centerPoint.x - rectSize.width/2;
    CGFloat y = centerPoint.y - rectSize.height/2;
    return (CGRect){{x, y}, rectSize};
}

CGRect CGRectResize(CGRect original, CGSize newSize, RFResizeAnchor resizeAnchor) {
    CGFloat x = original.origin.x;
    CGFloat y = original.origin.y;
    CGFloat w = original.size.width;
    CGFloat h = original.size.height;
    
    CGFloat wNew = newSize.width;
    CGFloat hNew = newSize.height;
    
    switch (resizeAnchor) {
        case RFResizeAnchorCenter:
            x += (w - wNew)/2;
            y += (h - hNew)/2;
            break;
        
        case RFResizeAnchorTop:
            x += (w - wNew)/2;
            break;
            
        case RFResizeAnchorBottom:
            x += (w - wNew)/2;
            y += (h - hNew);
            break;
            
        case RFResizeAnchorLeft:
            y += (h - hNew)/2;
            break;
            
        case RFResizeAnchorRight:
            x += (w - wNew);
            y += (h - hNew)/2;
            break;
            
        case RFResizeAnchorTopLeft:
            break;
            
        case RFResizeAnchorTopRight:
            x += (w - wNew);
            break;
            
        case RFResizeAnchorBottomLeft:
            y += (h - hNew);
            break;
            
        case RFResizeAnchorBottomRight:
            x += (w - wNew);
            y += (h - hNew);
            break;
            
        default:
            dout_warning(@"CGRectResize >> Unknow RFResizeAnchor.")
            return CGRectZero;
    }
    return CGRectMake(x, y, wNew, hNew);
}
CGRect CGRectChange(CGRect original, RFCGRectChangeFlag flag, CGFloat newValue) {
	CGRect rect = original;
	switch (flag) {
		case RFCGRectChangeX:
			rect.origin.x = newValue;
			break;
			
		case RFCGRectChangeY:
			rect.origin.y = newValue;
			break;
		
		case RFCGRectChangeWidth:
			rect.size.width = newValue;
			break;
			
		case RFCGRectChangeHeight:
			rect.size.height = newValue;
			break;
	}
	return rect;
}

#pragma mark CGAngle
CGAngle CGAngleFromPoints(CGPoint start, CGPoint end) {
//	float t = atan2f(end.y-start.y, end.x-start.x);
//	dout_float(CGAngleDegrees(t))
	return atan2f(end.y-start.y, end.x-start.x);
}
float CGAngleDegrees(CGAngle a) {
	return a/M_PI*180.f;
}
