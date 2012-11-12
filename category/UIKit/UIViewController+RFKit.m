
#import "RFKit.h"
#import "UIViewController+RFKit.h"

@implementation UIViewController (RFKit)

- (void)setNavTitle:(NSString *)title back:(NSString *)backTitle{
	self.title = title;
	UIBarButtonItem * tmpBack = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:nil];
	self.navigationItem.backBarButtonItem = tmpBack;
	RF_RELEASE_OBJ(tmpBack);
}

- (void)addChildViewController:(UIViewController *)childController intoView:(UIView *)subview {
    [self addChildViewController:childController];
    if (subview) {
        [subview addSubview:childController.view];
    }
    else {
        [self.view addSubview:childController.view];
    }
}

- (void)removeFromParentViewControllerAndView {
    if (self.view.superview) {
        [self.view removeFromSuperview];
    }
    
    if (self.parentViewController) {
        [self removeFromParentViewController];
    }
}

//! via: http://lldong.github.com/blog/2012/11/02/dissmiss-keyboard/
- (void)dismissKeyboard {    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
