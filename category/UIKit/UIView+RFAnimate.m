
#import "UIView+RFAnimate.h"
#import "RFRuntime.h"

@implementation UIView (RFAnimate)
@dynamic x, y, width, height, size, rightMargin, bottomMargin;

+ (NSSet *)keyPathsForValuesAffectingX {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}
+ (NSSet *)keyPathsForValuesAffectingY {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}
+ (NSSet *)keyPathsForValuesAffectingRightMargin {
    return [NSSet setWithObjects:@keypathClassInstance(UIView, frame), @keypathClassInstance(UIView, superview.bounds), nil];
}
+ (NSSet *)keyPathsForValuesAffectingBottomMargin {
    return [NSSet setWithObjects:@keypathClassInstance(UIView, frame), @keypathClassInstance(UIView, superview.bounds), nil];
}

+ (NSSet *)keyPathsForValuesAffectingWidth {
    return [NSSet setWithObject:@keypathClassInstance(UIView, bounds)];
}
+ (NSSet *)keyPathsForValuesAffectingHeight {
    return [NSSet setWithObject:@keypathClassInstance(UIView, bounds)];
}
+ (NSSet *)keyPathsForValuesAffectingSize {
    return [NSSet setWithObject:@keypathClassInstance(UIView, bounds)];
}


- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
}
- (CGFloat)rightMargin {
    return self.superview.width - self.width - self.x;
}
- (CGFloat)bottomMargin {
    return self.superview.height - self.height - self.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (CGSize)size {
    return self.frame.size;
}


- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setRightMargin:(CGFloat)rightMargin {
    self.x = self.superview.width - self.width - rightMargin;
}
- (void)setBottomMargin:(CGFloat)bottomMargin {
    self.y = self.superview.height - self.height - bottomMargin;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
