
#import "UIViewController+RFKit.h"

@implementation UIViewController (RFKit)

- (BOOL)isViewAppeared {
    if (self.isViewLoaded
        && self.view.window) {
        return YES;
    }
    return NO;
}

+ (nullable UIViewController *)rootViewControllerWhichCanPresentModalViewController {
    UIViewController *vc = (UIApplication.sharedApplication.keyWindow.rootViewController)? : UIApplication.sharedApplication.windows.firstObject.rootViewController;
    
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }
    
    return vc;
}

- (void)addChildViewController:(nonnull UIViewController *)childController intoView:(nullable UIView *)viewControllerSubview {
    [self addChildViewController:childController];
    if (viewControllerSubview) {
        [viewControllerSubview addSubview:childController.view];
    }
    else {
        [self.view addSubview:childController.view];
    }
    
    [self didMoveToParentViewController:self];
}

- (void)removeFromParentViewControllerAndView {
    [self willMoveToParentViewController:nil];

    if (self.isViewLoaded) {
        if (self.view.superview) {
            [self.view removeFromSuperview];
        }
    }
    
    if (self.parentViewController) {
        [self removeFromParentViewController];
    }
}

- (nullable id)parentViewControllerOfClass:(nonnull Class)viewControllerClas {
    UIViewController *vc = self.parentViewController;
    while (vc && ![vc isKindOfClass:viewControllerClas]) {
        vc = vc.parentViewController;
    }
    return vc;
}

//! REF: http://lldong.github.io/2012/11/02/dissmiss-keyboard.html
- (void)dismissKeyboard {
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
