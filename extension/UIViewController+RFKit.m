
#import "RFKit.h"
#import "UIViewController+RFKit.h"

@implementation UIViewController (RFKit)

- (void)setNavTitle:(NSString *)title back:(NSString *)backTitle{
	self.title = title;
	UIBarButtonItem * tmpBack = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:nil];
	self.navigationItem.backBarButtonItem = tmpBack;
	RF_RELEASE_OBJ(tmpBack);
}

@end
