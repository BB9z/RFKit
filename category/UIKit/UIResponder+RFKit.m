
#import "RFKit.h"
#import "UIResponder+RFKit.h"

@implementation UIResponder (RFKit)

- (id)viewController {
    id nextResponder = self;
    do {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return nextResponder;
        }
    } while ((nextResponder = [nextResponder nextResponder]));

    return nil;
}

@end
