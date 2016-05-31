/*!
    RFFeatureSupport
    RFUI

    Copyright (c) 2012-2013, 2016 BB9z
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
#define RFForSubclass                       NSObject

// All property support key value observing.
#define RFSupportKeyValueObserving          NSObject

/**
 Apply this attribute to a function or method declaration to indicate that a parameter will not be stored for later execution, such that it is guaranteed not to outlive the lifetime of the call. Function type parameters with the noescape declaration attribute do not require explicit use of self. for properties or methods.

 @code
 - (BOOL)doSomethingWithBlock:(RF_NOESCAPE void(^)(void))block;
 @endcode
 */
#if __has_attribute(noescape)
#  define RF_NOESCAPE __attribute__((noescape))
#else
#  define RF_NOESCAPE
#endif

/**
 Apply this attribute to a method or function declaration to have the compiler emit a warning when the method or function is called without using its result.

 You can use this attribute to provide a warning message about incorrect usage of a nonmutating method that has a mutating counterpart.

 @code
 - (id)addObserverForSomething RF_WARN_UNUSED_RESULT;
 @endcode
 */
#if __has_attribute(warn_unused_result)
#  define RF_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
#  define RF_WARN_UNUSED_RESULT
#endif
