/*!
    UIDevice extension
    RFKit

    Copyright (c) 2012-2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"
#import <Availability.h>

@interface UIDevice (RFKit)

/// If the device is iPad.
/// Detect using userInterfaceIdiom.
- (BOOL)isPad;


/// Returns if the device has a retina screen.
/// Detect using UIScreen's scale property.
- (BOOL)isRetinaDisplay;


/// Get device's mac address
//! via: http://iphonedevelopertips.com/device/determine-mac-address.html
- (NSString *)macAddress;

/// Returns `YES` if the current process is being debugged (either running under the debugger or has a debugger attached post facto).
//! via: https://developer.apple.com/library/mac/#qa/qa1361/_index.html
- (BOOL)isBeingDebugged;

- (long long)fileSystemFreeSize;
- (long long)fileSystemSize;

@end
