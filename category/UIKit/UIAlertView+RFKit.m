
#import "UIAlertView+RFKit.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
@implementation UIAlertView (RFKit)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle {
    if (buttonTitle == nil) {
        buttonTitle = @"OK";
    }
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonTitle otherButtonTitles:nil] show];
}

@end
#pragma clang diagnostic pop
