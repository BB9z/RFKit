/*!
    UIView extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"
#import "RFGeometry.h"

typedef enum {
	RFViewResizeOptionNone		 = 0,
	RFViewResizeOptionFill		 = 1,
	RFViewResizeOptionAspectFill = 2,
	RFViewResizeOptionAspectFit	 = 3,
	RFViewResizeOptionOnlyWidth	 = 6,
	RFViewResizeOptionOnlyHeight = 7,
	RFViewResizeOptionCenter	 = 11,
} RFViewResizeOption;

@interface UIView (RFKit)

/** 
 @abstract Animate helper for animateWithDuration:delay:options:animations:completion:
 
 @param duration    The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
 @param delay       The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 @param options     A mask of options indicating how you want to perform the animations. For a list of valid constants, see UIViewAnimationOptions.
 @param animated    YES if animations should be executed; otherwise, NO.
 @param before      A block object to be executed before animations. If animated was NO, this block won’t executed. This parameter may be NULL.
 @param animations  A block object containing the changes to commit to the views. This is where you programmatically change any animatable properties of the views in your view hierarchy. This block takes no parameters and has no return value. This parameter must not be NULL.
 @param completion  A block object to be executed after animations block executed, regardless animated was YES or NO. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle. This parameter may be NULL.
 */
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animated:(BOOL)animated beforeAnimations:(void (^)(void))before animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

#pragma mark -
/**
 @abstract Move a UIView relative to it’s current position.
 
 @param x	X-axis distance to move
 @param y	Y-axis distance to move
 @see [UIView (RFKit) moveToX:Y:]
 */
- (void)moveX:(CGFloat)x Y:(CGFloat)y;

/**
 @abstract Move a UIView to specified position. 
 
 @discussion This method use frame setting new position. Set parameter equal to CGFLOAT_MAX if you don’t want move in that direction.
 
 @param x	New position on x-axis
 @param y	New position on y-axis
 @see  [UIView (RFKit) moveX:Y:]
 */
- (void)moveToX:(CGFloat)x Y:(CGFloat)y;

/** 
 @abstract Resize a UIView
 
 @discussion Set parameter equal to RFMathNotChange if you don’t want resize that direction.
 
 @param width	New width
 @param height	New height
 */
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height;
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height resizeAnchor:(RFResizeAnchor)resizeAnchor;

/**
 @abstract Resizes and moves the receiver view so it fits its superview bounds.
 */
- (void)sizeToFitSuperview;

#pragma mark - View Hierarchy Management
- (void)addSubview:(UIView *)view frame:(CGRect)rect;
- (void)addSubview:(UIView *)view resizeOption:(RFViewResizeOption)option;

- (void)removeSubview:(UIView *)view;
- (void)removeAllSubviews;

- (void)bringAboveView:(UIView *)aView;
- (void)sentBelowView:(UIView *)aView;

- (void)bringToFront;
- (void)sentToBack;

- (void)bringOneLevelUp;
- (void)sendOneLevelDown;

- (BOOL)isInFront;
- (BOOL)isAtBack;

- (void)exchangeDepthsWithView:(UIView *)swapView;

#pragma mark - Others
/** 
 @abstract A Boolean value that indicates whether the receiver is displayed.
 
 @discussion This method not only consider view’s hidden, alpha property or whether was added into a view or not. It looks up every supview to make sure the view is in screen’s bounds and not cliped indeed. But covered by another view is not considering.
 
 Before a view is added to the view hierarchies, such as within UIViewController’s viewDidLoad method, the view is not visible because it’s not on screen yet.
 
 @return `YES` if the view is visible, `NO` otherwise.
 */
- (BOOL)isVisible;

/**
 @return The frame rectangle, which describes the view’s location and size in its screen’s coordinate system.
 */
- (CGRect)frameOnScreen;

- (UIImage *)renderToImage;

- (CGFloat)distanceBetweenFrameBottomAndSuperviewBottom;


/**
 @abstract Traversing the responder chain to get a UIViewController reletive to the receiver.
  
 @warning The receiver may be not the returned view controller´s view property.
 
 @return A view controller, may not be the receiver´s parent.
*/
- (UIViewController *)viewController;

/**
 Return a newly view object unarchived from the nib file which located in the specified bundle.
 
 @param nibName The name of the nib file to associate with the view. If nil, this method looks for the nib file which has  the same name with the class name. The nib file name should not contain any leading path information and the .nib extension.
 
 @param nibBundle The bundle in which to search for the nib file. If nil, this method looks for the nib file in the main bundle.
 
 @return A view object. May be nil if cannot find specified archived object.
 */
+ (instancetype)loadWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle;

/**
 Return a newly view object unarchived from the nib file which located in the main bundle.
 
 @param nibName The name of the nib file to associate with the view. If nil, this method looks for the nib file which has  the same name with the class name. The nib file name should not contain any leading path information and the .nib extension.
 
 @return A view object. May be nil if cannot find specified archived object.
 
 @see loadWithNibName:bundle:
 */
+ (instancetype)loadWithNibName:(NSString *)nibName;

@end
