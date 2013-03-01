
#import "RFKit.h"
#import "UIWebView+RFKit.h"

@implementation UIWebView (RFKit)

- (void)clearBackgroundImages {
    self.opaque = NO;
    for (UIView *view in [[self.subviews firstObject] subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden = YES;
        }
    }
}

@end
