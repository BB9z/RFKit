
#import "UIView+RFAnimate.h"

@implementation UIView (RFAnimate)
@dynamic x, y, width, height, size;

+ (NSSet *)keyPathsForValuesAffectingX {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}
+ (NSSet *)keyPathsForValuesAffectingY {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}
+ (NSSet *)keyPathsForValuesAffectingWidth {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}
+ (NSSet *)keyPathsForValuesAffectingHeight {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}
+ (NSSet *)keyPathsForValuesAffectingSize {
    return [NSSet setWithObject:@keypathClassInstance(UIView, frame)];
}

- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.y;
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
