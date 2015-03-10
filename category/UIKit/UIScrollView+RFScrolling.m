
#import "UIScrollView+RFScrolling.h"

@implementation UIScrollView (RFScrolling)

- (void)scrollToTopAnimated:(BOOL)animated {
    CGRect topRect = CGRectMake(0, 0, 1, 1);
    [self scrollRectToVisible:topRect animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    CGFloat offsetY = self.contentSize.height - self.frame.size.height;
    if (offsetY > 0) {
        CGPoint offset = self.contentOffset;
        offset.y = offsetY;
        [self setContentOffset:offset animated:animated];
    }
}

@end

@implementation UITableView (RFScrolling)

- (void)scrollToLastRowAnimated:(BOOL)animated {
    NSInteger section = [self numberOfSections] - 1;
    if (section < 0) return;
    NSInteger row = [self numberOfRowsInSection:section] - 1;
    if (row < 0) return;

    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
