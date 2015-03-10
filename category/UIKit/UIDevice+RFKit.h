/*!
    UIDevice extension
    RFKit

    Copyright (c) 2012-2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

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

/** If current device is iPad.
 
 Detect using userInterfaceIdiom.
 
 @return `YES` if current device is iPad, otherwise `NO`.
 */
- (BOOL)isPad NS_AVAILABLE_IOS(3_2);


/** If the device has a retina screen.

 Detect using UIScreen's scale property.

 @return `YES` if the device has a retina screen, otherwise `NO`.
 */
- (BOOL)isRetinaDisplay NS_AVAILABLE_IOS(4_0);


//! via: http://iphonedevelopertips.com/device/determine-mac-address.html
/** Get device's mac address
 
 @warning You cannt get a correct mac address on iOS 7. Do not use this any more. More: https://developer.apple.com/news/?id=8222013a
 */
- (NSString *)macAddress DEPRECATED_ATTRIBUTE;

/// Returns `YES` if the current process is being debugged (either running under the debugger or has a debugger attached post facto).
//! via: https://developer.apple.com/library/mac/#qa/qa1361/_index.html
- (BOOL)isBeingDebugged NS_AVAILABLE_IOS(2_0);

/**
 
 @return The amount of free space on the file system. 
 */
- (long long)fileSystemFreeSize NS_AVAILABLE_IOS(2_0);
- (long long)fileSystemSize NS_AVAILABLE_IOS(2_0);

@end
