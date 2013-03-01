
#import "UIStoryboard+RFKit.h"

@implementation UIStoryboard (RFKit)

- (id)instantiateViewControllerWithIdentifierUsingClass:(Class)viewControllerClass {
    return [self instantiateViewControllerWithIdentifier:NSStringFromClass(viewControllerClass)];
}

@end
