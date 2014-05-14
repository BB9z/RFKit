
#import "RFKit.h"
#import "UIViewController+RFKit.h"

@implementation UIViewController (RFKit)

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
    
    if (self.view.superview) {
        [self.view removeFromSuperview];
    }
    
    if (self.parentViewController) {
        [self removeFromParentViewController];
    }
}

//! ref: http://lldong.github.com/blog/2012/11/02/dissmiss-keyboard/
- (void)dismissKeyboard {
    if ([self isViewLoaded]) {
        if ([self.view endEditing:NO]) {
            return;
        }
    }
    
    // The text field which present the keyboaed not belonging to this view controller.
    // So traversing responder chain now.
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
