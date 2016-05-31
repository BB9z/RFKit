
#import "UIViewController+RFKit.h"

@implementation UIViewController (RFKit)

- (BOOL)isViewAppeared {
    if (self.isViewLoaded
        && self.view.window) {
        return YES;
    }
    return NO;
}

+ (UIViewController *)rootViewControllerWhichCanPresentModalViewController {
    UIViewController *vc = ([UIApplication sharedApplication].keyWindow.rootViewController)? : [(UIWindow *)[[UIApplication sharedApplication].windows firstObject] rootViewController];
    
    while (vc.presentedViewController) {
        vc = vc.presentedViewController;
    }
    
    return vc;
}

- (void)addChildViewController:(UIViewController *)childController intoView:(UIView *)viewControllerSubview {
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

- (id)parentViewControllerOfClass:(Class)viewControllerClas {
    UIViewController *vc = self.parentViewController;
    while (vc && ![vc isKindOfClass:viewControllerClas]) {
        vc = vc.parentViewController;
    }
    return vc;
}

//! ref: http://lldong.github.com/blog/2012/11/02/dissmiss-keyboard/
- (void)dismissKeyboard {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
