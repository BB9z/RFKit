
#import "UIAlertView+RFKit.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
@implementation UIAlertView (RFKit)

+ (void)showWithTitle:(nullable NSString *)title message:(nullable NSString *)message buttonTitle:(nullable NSString *)buttonTitle {
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonTitle?: @"OK" otherButtonTitles:nil] show];
}

@end
#pragma clang diagnostic pop
