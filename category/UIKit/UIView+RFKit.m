
#import "UIView+RFKit.h"
#import "UIResponder+RFKit.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (RFKit)

+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animated:(BOOL)animated beforeAnimations:(void (^_Nullable)(void))before animations:(void (^_Nullable)(void))animations completion:(void (^_Nullable)(BOOL finished))completion {
    if (animated) {
        if (before) {
            before();
        }
        [UIView animateWithDuration:duration delay:delay options:options animations:(id)animations completion:completion];
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

#pragma mark -
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

- (void)sizeToFitSuperview {
    self.frame = self.superview.bounds;
}

#pragma mark - View Hierarchy Management

+ (UIView *)commonSuperviewWith:(UIView *)view1 anotherView:(UIView *)view2 {
    NSParameterAssert(view1);
    NSParameterAssert(view2);
    if (view1 == view2) return view1.superview;

    // They are in diffrent window, so they wont have a common ancestor.
    if (view1.window != view2.window) return nil;

    // As we don’t know which view has a heigher level in view hierarchy,
    // We will add these view and their superview to an array.
    NSMutableArray *mergedViewHierarchy = [@[ view1, view2 ] mutableCopy];
    UIView *commonSuperview = nil;

    // Loop until all superviews are included in this array or find a view’s superview in this array.
    NSUInteger checkIndex = 0;
    UIView *checkingView = nil;
    while (checkIndex < mergedViewHierarchy.count && !commonSuperview) {
        checkingView = mergedViewHierarchy[checkIndex++];

        UIView *superview = checkingView.superview;
        if ([mergedViewHierarchy containsObject:superview]) {
            commonSuperview = superview;
        }
        else if (checkingView.superview) {
            [mergedViewHierarchy addObject:superview];
        }
    }
    return commonSuperview;
}

- (void)addSubview:(UIView *_Nonnull)view frame:(CGRect)rect {
	[self addSubview:view];
	view.frame = rect;
}

- (void)addSubview:(UIView *_Nonnull)view resizeOption:(RFViewResizeOption)option {
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
			view.center = CGPointOfRectCenter(self.bounds);
			break;
            
        case RFViewResizeOptionNone:
			break;
	}
}

- (void)removeSubview:(UIView *)view {
    if ([self.subviews indexOfObject:view] != NSNotFound) {
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

- (NSUInteger)_rf_siblingIndex {
	return [self.superview.subviews indexOfObject:self];
}

- (void)bringToFront {
	[self.superview bringSubviewToFront:self];
}

- (void)sentToBack {
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

- (void)bringOneLevelUp {
	NSUInteger ixCurrent = [self _rf_siblingIndex];
	[self.superview exchangeSubviewAtIndex:ixCurrent withSubviewAtIndex:ixCurrent+1];
}

- (void)sendOneLevelDown {
	NSUInteger ixCurrent = [self _rf_siblingIndex];
	[self.superview exchangeSubviewAtIndex:ixCurrent withSubviewAtIndex:ixCurrent-1];
}

- (BOOL)isInFront {
    return ([self.superview.subviews lastObject] == self);
}

- (BOOL)isAtBack {
    return ((self.superview.subviews)[0] == self);
}

- (void)exchangeDepthsWithView:(UIView *)swapView {
    if (!swapView) return;
	[self.superview exchangeSubviewAtIndex:[self _rf_siblingIndex] withSubviewAtIndex:[swapView _rf_siblingIndex]];
}

- (id _Nullable)superviewOfClass:(Class _Nonnull)viewClass {
    UIView *_Nullable ctView = self.superview;
    while (ctView && ![ctView isKindOfClass:viewClass]) {
        ctView = ctView.superview;
    }
    return ctView;
}

#pragma mark - Others

- (BOOL)isVisible {
    _douto(self)
    
    if (self.hidden || self.alpha == 0.f) {
        return NO;
    }
    
    // Window is special. There may be an external screen.
    if ([self isKindOfClass:[UIWindow class]]) {
        UIWindow *selfRef = (UIWindow *)self;
        if (!selfRef.screen) return NO;
        return CGRectIntersectsRect(selfRef.screen.bounds, selfRef.frame);
    }
    
    // Not added to a window.
    if (!self.window) {
        _dout_info(@"View not added to view hierarchies yet.");
        return NO;
    }
    
    // Out side screen bounds.
    if (!CGRectIntersectsRect(self.window.screen.bounds, [self frameOnScreen])) {
        _dout_info(@"Out side screen.")
        return NO;
    }
    
    // The rect is in window, now check superviews.
    UIView *parent = self.superview;
    CGRect ctFrame = self.frame;
    while (parent.superview) {
        _dout_rect(ctFrame)
        _douto(parent)
        
        if (parent.clipsToBounds && !CGRectIntersectsRect(parent.bounds, ctFrame)) {
            _dout_info(@"Outside cliped view");
            return NO;
        }
        
        if (parent.hidden || parent.alpha == 0.f) return NO;
        
        ctFrame = [parent convertRect:ctFrame toView:parent.superview];
        parent = parent.superview;
    }
    
    // parent is window, check screen now
    UIWindow *aWindow = (UIWindow *)parent;
    if (aWindow.clipsToBounds && !CGRectIntersectsRect(aWindow.screen.bounds, [aWindow convertRect:ctFrame toWindow:nil])) {
        return NO;
    }
    return YES;
}

- (CGRect)frameOnScreen {
    CGRect frameInWindow = [self convertRect:self.bounds toView:nil];
    _dout_rect(frameInWindow)
    _dout_rect([self.window convertRect:frameInWindow toWindow:nil])
    return [self.window convertRect:frameInWindow toWindow:nil];
}

- (CGRect)boundsInView:(UIView *_Nullable)view {
    return [self convertRect:self.bounds toView:view];
}

- (UIImage *_Nullable)renderToImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    if (!ref) return nil;
    [self.layer renderInContext:ref];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (CGFloat)distanceBetweenFrameBottomAndSuperviewBottom {
	CGRect frame = self.frame;
	CGFloat hSuper = self.superview.bounds.size.height;
	return hSuper - frame.origin.y - frame.size.height;
}

- (UIViewController *_Nullable)viewController {
    return [self.nextResponder viewController];
}

+ (instancetype _Nullable)loadWithNibName:(NSString *_Nullable)nibName bundle:(NSBundle *_Nullable)nibBundle {
    if (!nibName) {
        nibName = NSStringFromClass([self class]);
    }
    if (!nibBundle) {
        nibBundle = [NSBundle mainBundle];
    }
    for (id obj in [nibBundle loadNibNamed:nibName owner:nil options:nil]) {
        if ([obj isKindOfClass:[self class]]) {
            return obj;
        }
    }
    return nil;
}

+ (instancetype _Nullable)loadWithNibName:(NSString *_Nullable)nibName {
    return [self loadWithNibName:nibName bundle:nil];
}

@end
