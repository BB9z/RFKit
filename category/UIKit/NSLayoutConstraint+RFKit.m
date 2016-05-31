
#import "NSLayoutConstraint+RFKit.h"
#import "UIView+RFKit.h"

@implementation NSLayoutConstraint (RFKit)

- (void)updateLayoutIfNeeded {
    if (!self.firstItem && !self.secondAttribute) return;

    if (!self.firstItem || !self.secondAttribute) {
        if (self.firstItem) {
            [self.firstItem layoutIfNeeded];
        }
        if (self.secondItem) {
            [self.secondItem layoutIfNeeded];
        }
        return;
    }

    UIView *comment = [UIView commonSuperviewWith:(UIView *_Nonnull)self.firstItem anotherView:(UIView *_Nonnull)self.secondItem];
    [comment layoutIfNeeded];
}

@end
