/*!
 RFFrameChangeProxy
 RFKit
 
 Copyright (c) 2012-2014, 2017-2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFRuntime.h"

#ifndef RFFrameChangeLog
#if TARGET_OS_OSX
#   define RFFrameChangeLog \
    - (void)setFrame:(NSRect)frame {\
        dout(@"Change frame from %@ to %@. Trace:", NSStringFromRect(self.frame), NSStringFromRect(frame));\
        [super setFrame:frame];\
        douttrace()\
    }
#else
#   define RFFrameChangeLog \
    - (void)setFrame:(CGRect)frame {\
        dout(@"Change frame from %@ to %@. Trace:", NSStringFromCGRect(self.frame), NSStringFromCGRect(frame));\
        [super setFrame:frame];\
        douttrace()\
    }
#endif
#endif

#ifndef _RFFrameChangeLog
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#   define _RFFrameChangeLog
#pragma clang diagnostic pop
#endif

API_AVAILABLE(macos(10.0), ios(2.0), tvos(9.0))
@interface RFFrameChangeProxyView : UIView
@end
