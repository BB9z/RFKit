/*!
    UIDevice extension
    RFKit

    Copyright (c) 2012-2016, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

#ifndef RF_iOS10Before
#   define RF_iOS10Before (floor(NSFoundationVersionNumber) < 1300)
#endif

#ifndef RF_iOS9Before
#   define RF_iOS9Before (floor(NSFoundationVersionNumber) < 1200)
#endif

#ifndef RF_iOS8Before
#   define RF_iOS8Before (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1)
#endif

#ifndef RF_iOS7Before
#   define RF_iOS7Before (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
#endif

#ifndef RF_iOS6Before
#   define RF_iOS6Before (floor(NSFoundationVersionNumber) < NSFoundationVersionNumber_iOS_6_0)
#endif

@interface UIDevice (RFKit)

/**
 If current device is iPad.
 
 Detect using userInterfaceIdiom.
 
 @return `YES` if current device is iPad, otherwise `NO`.
 */
- (BOOL)isPad API_AVAILABLE(ios(3.2), tvos(9.0));

/**
 If the device has a retina screen.

 Detect using UIScreen's scale property.

 @return `YES` if the device has a retina screen, otherwise `NO`.
 */
- (BOOL)isRetinaDisplay API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 Returns `YES` if the current process is being debugged (either running under the debugger or has a debugger attached post facto).
 */
- (BOOL)isBeingDebugged API_AVAILABLE(ios(2.0), tvos(9.0));

/**
 @return The amount of free space on the file system. 
 */
- (long long)fileSystemFreeSize API_AVAILABLE(ios(6.0), tvos(9.0));

/**
 @return The size of the file system.
 */
- (long long)fileSystemSize API_AVAILABLE(ios(6.0), tvos(9.0));

@end
