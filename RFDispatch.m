
#import "RFDispatch.h"

void dispatch_after_seconds(NSTimeInterval delayInSeconds, dispatch_block_t block) {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}
