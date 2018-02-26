
#import "RFKit.h"

double RFKitVersionNumber = 1007000.0;

// Xcode 7: 6294649 Lightweight generics
#if !__has_feature(objc_generics)
#   error "RFKit requires generics which is provided on Xcode 7 or later."
#endif

// Xcode 7: 19589424
#if !__has_feature(objc_kindof)
#   error "RFKit requires __kindof type which is provided on Xcode 7 or later."
#endif

#if !__has_feature(objc_arc)
#   error "You must build RFKit with ARC."
#endif
