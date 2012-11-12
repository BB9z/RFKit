
#import "RFKit.h"
#import "UIAlertView+RFKit.h"

@implementation UIAlertView (RFKit)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message  buttonTitle:(NSString *)buttonTitle {
    if (buttonTitle == nil) {
        buttonTitle = @"OK";
    }
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonTitle otherButtonTitles:nil] show];
}

@end
