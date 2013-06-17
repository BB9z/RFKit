/*!
    UIDevice extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

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

#pragma mark - DEPRECATED class methods
+ (BOOL)isPad DEPRECATED_ATTRIBUTE;
+ (BOOL)isRetinaDisplay DEPRECATED_ATTRIBUTE;
+ (NSString *)macAddress DEPRECATED_ATTRIBUTE;
+ (long long)fileSystemFreeSize DEPRECATED_ATTRIBUTE;
+ (long long)fileSystemSize DEPRECATED_ATTRIBUTE;

@end
