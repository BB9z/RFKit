
#import "UIView+RFAnimate.h"

@implementation UIView (RFAnimate)

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

- (void)setX:(CGFloat)x {
    [self willChangeValueForKey:@keypath(self.frame.origin, x)];
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    [self didChangeValueForKey:@keypath(self.frame.origin, x)];
}
- (void)setY:(CGFloat)y {
    [self willChangeValueForKey:@keypath(self.frame.origin, y)];
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    [self didChangeValueForKey:@keypath(self.frame.origin, y)];
}
- (void)setWidth:(CGFloat)width {
    [self willChangeValueForKey:@keypath(self.frame.size, width)];
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    [self didChangeValueForKey:@keypath(self.frame.size, width)];
}
- (void)setHeight:(CGFloat)height {
    [self willChangeValueForKey:@keypath(self.frame.size, height)];
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
    [self didChangeValueForKey:@keypath(self.frame.size, height)];
}


@end
