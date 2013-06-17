/*!
    RFDispatch
    RFKit

    GCD helper

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

/** Short version for dispatch_after.
 
 @warning The block will be executed on main thread.
 */
#ifdef __BLOCKS__
__OSX_AVAILABLE_STARTING(__MAC_10_6,__IPHONE_4_0)
DISPATCH_EXPORT DISPATCH_NONNULL2 DISPATCH_NOTHROW
void dispatch_after_seconds(NSTimeInterval delayInSeconds, dispatch_block_t block);
#endif
