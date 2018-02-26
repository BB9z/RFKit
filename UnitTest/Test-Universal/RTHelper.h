//
//  RTHelper.h
//  RFKit
//
//  Created by BB9z on 22/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import "RFRuntime.h"

/**
 Helper methods for unit test.
 */
@interface RTHelper : NSObject

@end

#if TARGET_OS_OSX

#else
/// Compare two image.
BOOL RTImageCompare(UIImage *a, UIImage *b, double tolerance);
#endif // END: TARGET_OS_OSX
