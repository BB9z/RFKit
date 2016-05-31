/*!
    RFDispatch
    RFKit

    GCD helper

    Copyright (c) 2012-2015 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

#ifdef __BLOCKS__

/** Short version for dispatch_after.

 @warning The block will be executed on main thread.
 */
__OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_4_0)
DISPATCH_EXPORT DISPATCH_NONNULL2 DISPATCH_NOTHROW
void dispatch_after_seconds(NSTimeInterval delayInSeconds, dispatch_block_t block);

/**
 Submits a block object for execution on the main queue and waits until that block completes.
 
 You can call this function on the application’s main thread and won’t results in deadlock.
 */
__OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_4_0)
DISPATCH_EXPORT DISPATCH_NONNULL_ALL DISPATCH_NOTHROW
void dispatch_sync_on_main(dispatch_block_t block);

/**
 Submits a block for asynchronous execution on the main queue.
 */
__OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_4_0)
DISPATCH_EXPORT DISPATCH_NONNULL_ALL DISPATCH_NOTHROW
void dispatch_async_on_main(dispatch_block_t block);

/**
 Submits a block for asynchronous execution on the global background concurrent queue.
 */
__OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_4_0)
DISPATCH_EXPORT DISPATCH_NONNULL_ALL DISPATCH_NOTHROW
void dispatch_async_on_background(dispatch_block_t block);

/**
 Create a dispatch_time_t using the specified time.
 */
__OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_4_0)
DISPATCH_EXPORT DISPATCH_WARN_RESULT DISPATCH_NOTHROW
dispatch_time_t dispatch_time_after_seconds(NSTimeInterval delayInSeconds);

#endif
