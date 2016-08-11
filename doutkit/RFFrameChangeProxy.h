/*!
    RFFrameChangeProxy
    RFKit

    Copyright (c) 2012-2014 BB9z
    https://github.com/RFUI/Core

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFRuntime.h"

#ifndef RFFrameChangeLog
#   define RFFrameChangeLog \
    - (void)setFrame:(CGRect)frame {\
        dout(@"Change frame from %@ to %@. Trace:", NSStringFromCGRect(self.frame), NSStringFromCGRect(frame));\
        [super setFrame:frame];\
        douttrace()\
    }
#endif

#ifndef _RFFrameChangeLog
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#   define _RFFrameChangeLog
#pragma clang diagnostic pop
#endif

@interface RFFrameChangeProxyView : UIView

@end
