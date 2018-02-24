/*!
    UIView extension
    RFKit

    Copyright (c) 2012-2016, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>
#import "RFGeometry.h"

typedef NS_ENUM(NSInteger, RFViewResizeOption) {
	RFViewResizeOptionNone		 = 0,
	RFViewResizeOptionFill		 = 1,
	RFViewResizeOptionAspectFill = 2,
	RFViewResizeOptionAspectFit	 = 3,
	RFViewResizeOptionOnlyWidth	 = 6,
	RFViewResizeOptionOnlyHeight = 7,
	RFViewResizeOptionCenter	 = 11,
} ;

@interface UIView (RFKit)

/**
 Animate helper for animateWithDuration:delay:options:animations:completion:
 
 @param duration    The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
 @param delay       The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
 @param options     A mask of options indicating how you want to perform the animations. For a list of valid constants, see UIViewAnimationOptions.
 @param animated    YES if animations should be executed; otherwise, NO.
 @param before      A block object to be executed before animations. If animated was NO, this block won’t executed.
 @param animations  A block object containing the changes to commit to the views. This is where you programmatically change any animatable properties of the views in your view hierarchy. This block takes no parameters and has no return value.
 @param completion  A block object to be executed after animations block executed, regardless animated was YES or NO. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle.
 */
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animated:(BOOL)animated beforeAnimations:(void (^__nullable)(void))before animations:(void (^__nullable)(void))animations completion:(void (^__nullable)(BOOL finished))completion API_AVAILABLE(ios(4.0), tvos(9.0));

#pragma mark -

/**
 Move a UIView relative to it’s current position.
 
 @param x	X-axis distance to move
 @param y	Y-axis distance to move
 @see [UIView (RFKit) moveToX:Y:]
 */
- (void)moveX:(CGFloat)x Y:(CGFloat)y API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Move a UIView to specified position.
 
 This method use frame setting new position. Set parameter equal to CGFLOAT_MAX if you don’t want move in that direction.
 
 @param x	New position on x-axis
 @param y	New position on y-axis
 @see  [UIView (RFKit) moveX:Y:]
 */
- (void)moveToX:(CGFloat)x Y:(CGFloat)y API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Resize a UIView
 
 Set parameter equal to RFMathNotChange if you don’t want resize that direction.
 
 @param width	New width
 @param height	New height
 */
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Resize a UIView relative to the specified anchor point.
 
 Set parameter equal to RFMathNotChange if you don’t want resize that direction.
 
 @param width    New width
 @param height   New height
 @param resizeAnchor Determine how to change the frame with the new size.
 */
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height resizeAnchor:(RFResizeAnchor)resizeAnchor API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Resizes and moves the receiver view so it fits its superview bounds.
 */
- (void)sizeToFitSuperview API_AVAILABLE(ios(2.0), tvos(9.0));

#pragma mark - View Hierarchy Management

/**
 Got the common ancestor of two view.
 
 @param view1 This value must not be `nil`.
 @param view2 This value must not be `nil`.
 */
+ (nullable UIView *)commonSuperviewWith:(nonnull UIView *)view1 anotherView:(nonnull UIView *)view2 API_AVAILABLE(ios(6.0), tvos(9.0));

/**
 Adds a view to the view’s subviews and changes the frame rectangle at the same time.
 */
- (void)addSubview:(nonnull UIView *)view frame:(CGRect)rect API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Adds a view to the view’s subviews and resizes at the same time.
 */
- (void)addSubview:(nonnull UIView *)view resizeOption:(RFViewResizeOption)option API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Remove a view from the reciver’s subviews.
 */
- (void)removeSubview:(nullable UIView *)view API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Remove the reciver’s all subviews.
 */
- (void)removeAllSubviews API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Moves the reciver so that it appears above another view in the view hierarchy.
 */
- (void)bringAboveView:(nullable UIView *)aView API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Moves the reciver so that it appears above another view in the view hierarchy.
 */
- (void)sentBelowView:(nullable UIView *)aView API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Moves the reciver so that it appears on top of its siblings in the view hierarchy.
 */
- (void)bringToFront API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Moves the reciver so that it appears behind its siblings in the view hierarchy.
 */
- (void)sentToBack API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Exchange the reciver and the view above the reciver in the view hierarchy.
 */
- (void)bringOneLevelUp API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Exchange the reciver and the view below the reciver in the view hierarchy.
 */
- (void)sendOneLevelDown API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Returns a Boolean value indicating whether the receiver appears on top of its siblings.
 */
- (BOOL)isInFront API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Returns a Boolean value indicating whether the receiver appears behind of its siblings.
 */
- (BOOL)isAtBack API_AVAILABLE(ios(2.0), tvos(9.0));

- (void)exchangeDepthsWithView:(nullable UIView *)swapView DEPRECATED_ATTRIBUTE;

/**
 Find a superview of the receiver which is kind of the given class in view hierarchy.
 */
- (nullable __kindof UIView *)superviewOfClass:(nonnull Class)viewClass API_AVAILABLE(ios(2.0), tvos(9.0));

#pragma mark - Others

/**
 A Boolean value that indicates whether the receiver is displayed.
 
 This method not only consider view’s hidden, alpha property or whether was added into a view or not. It looks up every supview to make sure the view is in screen’s bounds and not cliped indeed. But covered by another view is not considering.
 
 Before a view is added to the view hierarchies, such as within UIViewController’s viewDidLoad method, the view is not visible because it’s not on screen yet.
 
 @return `YES` if the view is visible, `NO` otherwise.
 */
- (BOOL)isVisible API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 @return The frame rectangle, which describes the view’s location and size in its screen’s coordinate system.
 */
- (CGRect)frameOnScreen API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Converts the receiver’s bounds from the receiver’s coordinate system to that of the specified view.
 
 @param view The view that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates. Otherwise, both view and the receiver must belong to the same UIWindow object.

 @return The converted rectangle.
 */
- (CGRect)boundsInView:(nullable UIView *)view API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Renders the receiver’s layer into a UIImage object.
 */
- (nonnull UIImage *)renderToImage API_AVAILABLE(ios(4.0), tvos(9.0));

/**
 Returns the distance between the frame bottom and superview’s bound bottom.
 */
- (CGFloat)distanceBetweenFrameBottomAndSuperviewBottom API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Traversing the responder chain to get a UIViewController reletive to the receiver.
  
 @warning The receiver may be not the returned view controller´s view property.
 
 @return A view controller, may not be the receiver´s parent.
*/
- (nullable UIViewController *)viewController API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Return a newly view object unarchived from the nib file which located in the specified bundle.
 
 @param nibName The name of the nib file to associate with the view. If nil, this method looks for the nib file which has  the same name with the class name. The nib file name should not contain any leading path information and the .nib extension.
 
 @param nibBundle The bundle in which to search for the nib file. If nil, this method looks for the nib file in the main bundle.
 
 @return A view object. May be nil if cannot find specified archived object.
 */
+ (nullable instancetype)loadWithNibName:(nullable NSString *)nibName bundle:(nullable NSBundle *)nibBundle API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Return a newly view object unarchived from the nib file which located in the main bundle.
 
 @param nibName The name of the nib file to associate with the view. If nil, this method looks for the nib file which has  the same name with the class name. The nib file name should not contain any leading path information and the .nib extension.
 
 @return A view object. May be nil if cannot find specified archived object.
 
 @see loadWithNibName:bundle:
 */
+ (nullable instancetype)loadWithNibName:(nullable NSString *)nibName API_AVAILABLE(ios(2.0), tvos(9.0));

@end
