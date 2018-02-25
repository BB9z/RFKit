
#import "RFKit.h"

double RFKitVersionNumber = 1007000.0;

// Xcode 7: Generics
#ifndef __IPHONE_9_0
#   error "RFKit require Xcode 7 or later to build."
#endif

#if !__has_feature(objc_arc)
#   error "You must build RFKit with ARC."
#endif
