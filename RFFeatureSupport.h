/*!
    RFFeatureSupport
    RFUI

    Copyright (c) 2012-2013 BB9z
    https://github.com/RFUI/Core

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */


#import <Availability.h>
#import <AvailabilityMacros.h>

#pragma mark - Proxy delegate
//@protocol RFFeatureSupportProxyDelegate <NSObject>
//@end
/// These protocols are not real protocols, just a way to declare a class support something or not.

// For RFUI components, storyboard was first class supported.
// This protocol show a class not support init form nib. You must use init method to creat one.
#define RFNotSupportLoadFromNib             NSObject
#define RFOnlySupportLoadFromNib            NSObject

// 
#define RFForSubclass                      NSObject

// All property support key value observing.
#define RFSupportKeyValueObserving          NSObject

#define RFSupportIOS4_3                     NSObject
#define RFSupportIOS5_0                     NSObject
#define RFSupportIOS6_0                     NSObject

