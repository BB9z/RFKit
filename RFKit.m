
#import "RFKit.h"

double RFKitVersionNumber = 1005001.0;

#ifndef __IPHONE_9_0
#   error "RFKit require iOS SDK 9.0 or later to build."
#endif

#if !__has_feature(objc_arc)
#   error "You should build RFKit with ARC."
#endif
