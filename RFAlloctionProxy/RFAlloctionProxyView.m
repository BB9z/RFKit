
#import "RFAlloctionProxyView.h"
#import "RFPerformance.h"

@implementation RFAlloctionProxyView
RFAlloctionLog

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    douto(self.superview)
}

@end
