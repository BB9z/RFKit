/*!
    UIDevice extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

@interface UIDevice (RFKit)

/// If the device is iPad.
/// Detect using userInterfaceIdiom.
+ (BOOL)isPad;


/// Returns if the device has a retina screen.
/// Detect using UIScreen's scale property.
+ (BOOL)isRetinaDisplay;


/// Get device's mac address
//! via: http://iphonedevelopertips.com/device/determine-mac-address.html
+ (NSString *)macAddress;


+ (long long)fileSystemFreeSize;
+ (long long)fileSystemSize;

@end
