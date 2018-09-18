
#import "NSLayoutConstraint+RFKit.h"
#import "UIView+RFKit.h"

@implementation NSLayoutConstraint (RFKit)

- (void)updateLayoutIfNeeded {
    UIView *a = [(id<NSObject>)self.firstItem isKindOfClass:UIView.class]? self.firstItem : nil;
    UIView *b = [(id<NSObject>)self.secondItem isKindOfClass:UIView.class]? self.secondItem : nil;
    if (a && b) {
        [[UIView commonSuperviewWith:a anotherView:b] layoutIfNeeded];
        return;
    }
    if (a) {
        [a layoutIfNeeded];
    }
    if (b) {
        [b layoutIfNeeded];
    }
}

@end
