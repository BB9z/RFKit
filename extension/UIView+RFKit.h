/*!
 RFKit
 UIView extension
 */

//#import "RFKit.h"

typedef enum {
	RFViewResizeOptionNone		= 0,
	RFViewResizeOptionFill		= 1,
	RFViewResizeOptionAspectFill= 2,
	RFViewResizeOptionAspectFit	= 3,
	RFViewResizeOptionOnlyWidth	= 6,
	RFViewResizeOptionOnlyHeight= 7,
	RFViewResizeOptionCenter	= 11,
} RFViewResizeOption;

@interface UIView (RFKit)
- (BOOL)isVisible;

- (UIImage *)renderToImage;

/** Exchange a UIView`s width and Hight
 */
- (void)exhangeWidthHight;


/** Move a UIView relative to it`s position.
 
 @param x	X-axis distance to move
 @param y	Y-axis distance to move
 @see [UIView (extension) moveToX:Y:]
 */
- (void)moveX:(CGFloat)x Y:(CGFloat)y;


/** Move a UIView relative to it`s 
 
 This method use frame setting new position. Set parameter equal to CGFLOAT_MAX if you don`t want move in that direction. 
 
 @param x	New position on x-axis
 @param y	New position on y-axis
 @see  [UIView (extension) moveX:Y:]
 */
- (void)moveToX:(CGFloat)x Y:(CGFloat)y;


/** Resize a UIView
 
 Set parameter equal to RFMathNotChange if you don`t want resize that direction.
 
 @param width	New width
 @param height	New height
 */
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height;
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height resizeAnchor:(RFResizeAnchor)resizeAnchor;

- (CGFloat)distanceBetweenFrameBottomAndSuperviewBottom;

- (void)addSubview:(UIView *)view frame:(CGRect)rect;
- (void)addSubview:(UIView *)view resizeOption:(RFViewResizeOption)option;
- (void)removeSubview:(UIView *)view;

- (void)removeAllSubviews;

- (void)bringAboveView:(UIView *)aView;
- (void)bringToFront;
- (void)sentBelowView:(UIView *)aView;
- (void)sentToBack;

- (void)bringOneLevelUp;
- (void)sendOneLevelDown;

- (BOOL)isInFront;
- (BOOL)isAtBack;

- (void)exchangeDepthsWithView:(UIView *)swapView;

@end
