
#import "UIButton+RFKit.h"

@implementation UIButton (RFKit)

- (void)setBackgroundImageResizingCapInsets:(UIEdgeInsets)capInsets forState:(UIControlState)state {
    UIImage *ri = [[self backgroundImageForState:state] resizableImageWithCapInsets:capInsets];
    [self setBackgroundImage:ri forState:state];
}

@end
