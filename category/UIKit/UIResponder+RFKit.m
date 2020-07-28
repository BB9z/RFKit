
#import "UIResponder+RFKit.h"

static __weak id _RFKit_UIResponder_currentFirstResponder;

@implementation UIResponder (RFKit)

- (nullable __kindof UIViewController *)viewController {
    __kindof UIResponder *nextResponder = self;
    do {
        if ([nextResponder isKindOfClass:UIViewController.class]) {
            return nextResponder;
        }
    } while ((nextResponder = nextResponder.nextResponder));

    return nil;
}

#if !TARGET_OS_OSX
//! REF: http://stackoverflow.com/a/14135456/945906
+ (nullable __kindof UIResponder *)firstResponder {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-repeated-use-of-weak"
    _RFKit_UIResponder_currentFirstResponder = nil;
    [UIApplication.sharedApplication sendAction:@selector(_rf_findFirstResponder:) to:nil from:nil forEvent:nil];
    return _RFKit_UIResponder_currentFirstResponder;
#pragma clang diagnostic pop
}

- (void)_rf_findFirstResponder:(id)sender {
    _RFKit_UIResponder_currentFirstResponder = self;
}
#endif

@end
