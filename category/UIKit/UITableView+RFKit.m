
#import "UITableView+RFKit.h"

@implementation UITableView (RFKit)

- (void)deselectRows:(BOOL)animated {
    for (NSIndexPath *row in self.indexPathsForSelectedRows) {
        [self deselectRowAtIndexPath:row animated:animated];
    }
}

@end
