
#import "RFDispatch.h"

void dispatch_after_seconds(NSTimeInterval delayInSeconds, dispatch_block_t block) {
    dispatch_after(dispatch_time_after_seconds(delayInSeconds), dispatch_get_main_queue(), block);
}

void dispatch_sync_on_main(dispatch_block_t block) {
    if ([NSThread isMainThread]) {
        block();
    }
    else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void dispatch_async_on_main(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

void dispatch_async_on_background(dispatch_block_t block) {
    dispatch_queue_t background_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(background_queue, block);
}

dispatch_time_t dispatch_time_after_seconds(NSTimeInterval delayInSeconds) {
    return dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
}
