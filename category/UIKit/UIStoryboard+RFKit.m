
#import "UIStoryboard+RFKit.h"

@implementation UIStoryboard (RFKit)

- (nonnull id)instantiateViewControllerWithIdentifierUsingClass:(nonnull Class)viewControllerClass {
    return [self instantiateViewControllerWithIdentifier:NSStringFromClass(viewControllerClass)];
}

@end
