
#import "NSLayoutConstraint+RFKit.h"
#import "UIView+RFKit.h"

@implementation NSLayoutConstraint (RFKit)

- (void)updateLayoutIfNeeded {
    if (!self.firstItem && !self.secondAttribute) return;

    if (!self.firstItem || !self.secondAttribute) {
        [self.firstItem layoutIfNeeded];
        [self.secondItem layoutIfNeeded];
        return;
    }

    UIView *comment = [UIView commonSuperviewWith:self.firstItem anotherView:self.secondItem];
    [comment layoutIfNeeded];
}

@end
