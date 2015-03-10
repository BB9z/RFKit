
#import "UINavigationController+RFKit.h"
#import "NSArray+RFKit.h"

@implementation UINavigationController (RFKit)
@dynamic disappearingViewController;
@dynamic previousViewController;

- (Class)previousViewControllerClassForViewController:(UIViewController *)viewController {
    return [[self previousViewControllerForViewController:viewController] class];
}

- (id)previousViewControllerForViewController:(UIViewController *)viewController {
    NSUInteger idx = [self.viewControllers indexOfObject:viewController];
    if (idx == 0 || idx == NSNotFound) return nil;

    return [self.viewControllers rf_objectAtIndex:(idx - 1)];
}

- (BOOL)hasViewControllerWithClass:(Class)aClass beforeViewController:(UIViewController *)viewController {
    return !!([self viewControllerWithClass:aClass beforeViewController:viewController]);
}

- (id)viewControllerWithClass:(Class)aClass beforeViewController:(UIViewController *)viewController {
    NSUInteger idx = NSNotFound;
    if (viewController) {
        idx = [self.viewControllers indexOfObject:viewController];
    }
    else {
        idx = self.viewControllers.count;
    }

    if (idx == 0 || idx == NSNotFound) {
        return nil;
    }

    NSArray *vcs = self.viewControllers;
    for (NSInteger i = (idx - 1); i >= 0; i--) {
        if ([vcs[i] isKindOfClass:aClass]) {
            return vcs[i];
        }
    }
    return nil;
}

- (void)setTopViewController:(UIViewController *)topViewController animated:(BOOL)animated {
    NSMutableArray *vcs = [self.viewControllers mutableCopy];
    vcs.lastObject = topViewController;
    [self setViewControllers:vcs animated:animated];
}

@end
