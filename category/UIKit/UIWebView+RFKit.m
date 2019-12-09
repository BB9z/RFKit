
#import "UIWebView+RFKit.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
@implementation UIWebView (RFKit)

- (void)clearBackgroundImages {
    self.opaque = NO;
    for (UIView *view in self.subviews.firstObject.subviews) {
        if ([view isKindOfClass:UIImageView.class]) {
            view.hidden = YES;
        }
    }
}

@end
#pragma clang diagnostic pop
