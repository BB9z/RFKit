
#import "RFFrameChangeProxy.h"

@implementation RFFrameChangeProxyView
RFFrameChangeLog

- (void)setBounds:(CGRect)bounds {
    dout(@"Change bounds from %@ to %@. Trace:", NSStringFromCGRect(self.bounds), NSStringFromCGRect(bounds));
    [super setBounds:bounds];
    douttrace()
}

@end
