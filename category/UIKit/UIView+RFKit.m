
#import "RFKit.h"

// Eliminate CALayer forward declaration warning
#import <QuartzCore/CALayer.h>

@implementation UIView (RFKit)

- (BOOL)isVisible {
	if (self.hidden == YES || self.alpha == 0.f) {
		return NO;
	}
	else {
		CGRect boundsInWindow = [self convertRect:self.bounds toView:nil];
		return !CGRectIsOutOfRect(boundsInWindow, [UIScreen mainScreen].bounds);
	}
}

- (UIImage *)renderToImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [[UIScreen mainScreen] scale]);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animated:(BOOL)animated beforeAnimations:(void (^)(void))before animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion {
    if (animated) {
        if (before) {
            before();
        }
        [UIView animateWithDuration:duration delay:delay options:options animations:animations completion:completion];
    }
    else {
        if (animations) {
            animations();
        }
        if (completion) {
            completion(YES);
        }
    }
}


#pragma mark 视图位置／尺寸

- (void)exhangeWidthHight {
	CGRect tmp = self.bounds;
	self.frame = CGRectMake(tmp.origin.x, tmp.origin.y, tmp.size.height, tmp.size.width);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wfloat-equal"
- (void)moveX:(CGFloat)x Y:(CGFloat)y {
	CGPoint tmp = self.center;
	if (x != RFMathNotChange) tmp.x += x;
	if (y != RFMathNotChange) tmp.y += y;
	self.center = tmp;
}

- (void)moveToX:(CGFloat)x Y:(CGFloat)y {
	CGRect tmp = self.frame;
	if (x != RFMathNotChange) tmp.origin.x = x;
	if (y != RFMathNotChange) tmp.origin.y = y;
	self.frame = tmp;
}

- (void)resizeWidth:(CGFloat)width height:(CGFloat)height {
    [self resizeWidth:width height:height resizeAnchor:RFResizeAnchorCenter];
}
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height resizeAnchor:(RFResizeAnchor)resizeAnchor {
    CGSize newSize = self.frame.size;
    if (width  != RFMathNotChange) newSize.width  = width;
	if (height != RFMathNotChange) newSize.height = height;
    CGRect targetFrame = CGRectResize(self.frame, newSize, resizeAnchor);
    self.frame = targetFrame;
}
#pragma clang diagnostic pop

- (CGFloat)distanceBetweenFrameBottomAndSuperviewBottom {
	CGRect frame = self.frame;
	CGFloat hSuper = self.superview.bounds.size.height;
	return hSuper - frame.origin.y - frame.size.height;
}

#pragma mark 视图层次管理
- (void)addSubview:(UIView *)view frame:(CGRect)rect {
	[self addSubview:view];
	view.frame = rect;
}

- (void)addSubview:(UIView *)view resizeOption:(RFViewResizeOption)option {
	[self addSubview:view];
	float aspect;
	float aspectSelf;
	CGFloat wSelf = self.bounds.size.width;
	CGFloat hSelf = self.bounds.size.height;
	CGFloat wView = view.bounds.size.width;
	CGFloat hView = view.bounds.size.height;
	
	switch (option) {
		case RFViewResizeOptionFill:
			view.frame = self.bounds;
			break;
			
		case RFViewResizeOptionAspectFill:
			aspect = view.bounds.size.width / view.bounds.size.height;
			aspectSelf = wSelf / hSelf;
			if (aspectSelf > aspect) {
				// fit width
				hView = hView*wSelf/wView;
				view.frame = CGRectMake(0, (hSelf - hView)/2, wSelf, hView);
			}
			else {
				wView = wView*hSelf/hView;
				view.frame = CGRectMake((wSelf - wView)/2, 0, wView, hSelf);
			}
			break;
			
		case RFViewResizeOptionAspectFit:
			aspect = view.bounds.size.width / view.bounds.size.height;
			aspectSelf = wSelf / hSelf;
			if (aspectSelf > aspect) {
				// fit height
				wView = wView*hSelf/hView;
				view.frame = CGRectMake((wSelf - wView)/2, 0, wView, hSelf);
			}
			else {
				hView = hView*wSelf/wView;
				view.frame = CGRectMake(0, (hSelf - hView)/2, wSelf, hView);
			}
			break;
			
		case RFViewResizeOptionOnlyWidth:
			view.frame = CGRectMake(0, (hSelf - hView)/2, hSelf, wView);
			break;
			
		case RFViewResizeOptionOnlyHeight:
			view.frame = CGRectMake((wSelf- wView)/2, 0, wView, hSelf);
			break;
			
		case RFViewResizeOptionCenter:
			view.center = self.center;
			break;
            
        case RFViewResizeOptionNone:
			break;
	}
}

- (void)removeSubview:(UIView *)view {
    if ([self.subviews indexOfObject:view]) {
        [view removeFromSuperview];
    }
    else {
        dout_warning(@"RFKit [UIView removeSubview] 父视图没有指定的子视图")
    }
}

- (void)removeAllSubviews {
	for (UIView * subview in self.subviews) {
		[subview removeFromSuperview];
	}
}

- (int)getSubviewIndex{
	return [self.superview.subviews indexOfObject:self];
}

- (void)bringToFront{
	[self.superview bringSubviewToFront:self];
}

- (void)sentToBack{
	[self.superview sendSubviewToBack:self];
}

- (void)bringAboveView:(UIView *)aView {
	if (aView == nil) {
		return;
	}
	CGRect tmp = self.frame;
	UIView * sup = self.superview;
	[self removeFromSuperview];
	[sup insertSubview:self aboveSubview:aView];
	self.frame = tmp;
}

- (void)sentBelowView:(UIView *)aView {
	if (aView == nil) {
		return;
	}
	CGRect tmp = self.frame;
	UIView * sup = self.superview;
	[self removeFromSuperview];
	[sup insertSubview:self belowSubview:aView];
	self.frame = tmp;
}

- (void)bringOneLevelUp{
	NSUInteger CurrentIndex = [self getSubviewIndex];
	[self.superview exchangeSubviewAtIndex:CurrentIndex withSubviewAtIndex:CurrentIndex+1];
}

- (void)sendOneLevelDown{
	int currentIndex = [self getSubviewIndex];
	[self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
}

- (BOOL)isInFront{
	return ([self.superview.subviews lastObject] == self);
}

- (BOOL)isAtBack{
	return ([self.superview.subviews objectAtIndex:0] == self);
}

- (void)exchangeDepthsWithView:(UIView*)swapView{
	[self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]];
}

@end
