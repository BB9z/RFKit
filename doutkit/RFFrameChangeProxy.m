
#import "RFFrameChangeProxy.h"

@implementation RFFrameChangeProxyView
RFFrameChangeLog

#if TARGET_OS_OSX
#define NSStringFromCGRect NSStringFromRect
#endif

- (void)setBounds:(CGRect)bounds {
    dout(@"Change bounds from %@ to %@. Trace:", NSStringFromCGRect(self.bounds), NSStringFromCGRect(bounds));
    [super setBounds:bounds];
    douttrace()
}

@end
