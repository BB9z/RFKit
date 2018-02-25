
#import "UINavigationController+RFKit.h"
#import "NSArray+RFKit.h"

@implementation UINavigationController (RFKit)
@dynamic disappearingViewController;
@dynamic previousViewController;

- (nullable Class)previousViewControllerClassForViewController:(nonnull UIViewController *)viewController {
    return [[self previousViewControllerForViewController:viewController] class];
}

- (nullable id)previousViewControllerForViewController:(nonnull UIViewController *)viewController {
    NSUInteger idx = [self.viewControllers indexOfObject:viewController];
    if (idx == 0 || idx == NSNotFound) return nil;

    return [self.viewControllers rf_objectAtIndex:(idx - 1)];
}

- (BOOL)hasViewControllerWithClass:(nonnull Class)aClass beforeViewController:(nullable UIViewController *)viewController {
    return !!([self viewControllerWithClass:aClass beforeViewController:viewController]);
}

- (id)viewControllerWithClass:(nonnull Class)aClass beforeViewController:(nullable UIViewController *)viewController {
    NSUInteger idx = NSNotFound;
    if (viewController) {
        idx = [self.viewControllers indexOfObject:(UIViewController *__nonnull)viewController];
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

- (void)setTopViewController:(nullable UIViewController *)topViewController animated:(BOOL)animated {
    NSMutableArray *vcs = self.viewControllers.mutableCopy;
    vcs.lastObject = topViewController;
    [self setViewControllers:vcs animated:animated];
}

@end
