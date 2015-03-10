
#import "UITableView+RFKit.h"
#import "UIView+RFAnimate.h"

@implementation UITableView (RFKit)

- (void)deselectRows:(BOOL)animated {
    for (NSIndexPath *row in self.indexPathsForSelectedRows) {
        [self deselectRowAtIndexPath:row animated:animated];
    }
}

- (id)dequeueReusableCellWithClass:(Class)cellClass {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

- (void)autoLayoutTableHeaderView {
    UIView *view = self.tableHeaderView;
    CGSize size = [view systemLayoutSizeFittingSize:CGSizeMake(view.width, 0)];
    view.size = size;
    self.tableHeaderView = view;
}

- (void)autoLayoutTableFooterView {
    UIView *view = self.tableFooterView;
    CGSize size = [view systemLayoutSizeFittingSize:CGSizeMake(view.width, 0)];
    view.size = size;
    self.tableHeaderView = view;
}

@end
