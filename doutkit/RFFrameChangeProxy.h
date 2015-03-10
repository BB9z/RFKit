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
#   define _RFFrameChangeLog
#endif

@interface RFFrameChangeProxyView : UIView

@end
