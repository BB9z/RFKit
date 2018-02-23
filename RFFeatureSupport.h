/*!
    RFFeatureSupport
    RFKit

    Copyright (c) 2012-2013, 2016, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Availability.h>
#import <AvailabilityMacros.h>

#pragma mark -
/// These protocols are not real protocols, just a way to declare a class support something or not.

/// For RFUI components, storyboard was first class supported.
/// This protocol show a class not support init form nib. You must use init method to creat one.
#define RFNotSupportLoadFromNib             NSObject
#define RFOnlySupportLoadFromNib            NSObject

// 
#define RFForSubclass                       NSObject

/// All property support key value observing.
#define RFSupportKeyValueObserving          NSObject

#pragma mark -

/**
 Apply this attribute to a function or method declaration to indicate that a parameter will not be stored for later execution, such that it is guaranteed not to outlive the lifetime of the call. Function type parameters with the noescape declaration attribute do not require explicit use of self. for properties or methods.

 @code
 - (BOOL)doSomethingWithBlock:(RF_NOESCAPE void(^)(void))block;
 @endcode
 
 @deprecated(RFKit(2.0)): Use NS_NOESCAPE
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
 
 @deprecated(RFKit(2.0)): Use NS_WARN_UNUSED_RESULT
 */
#if __has_attribute(warn_unused_result)
#  define RF_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
#  define RF_WARN_UNUSED_RESULT
#endif


#pragma mark - SDK backward compatibility

#pragma mark Xcode 9


#pragma mark Xcode 8
// Xcode 8, with macOS 10.12 and iOS 10 SDK
// https://developer.apple.com/library/content/releasenotes/Miscellaneous/RN-Foundation-OSX10.12/index.html

#ifndef NS_NOESCAPE
#   if __has_attribute(noescape)
#       define NS_NOESCAPE __attribute__((noescape))
#   else
#       define NS_NOESCAPE
#   endif
#endif

// API available
#ifndef API_AVAILABLE
#   define API_AVAILABLE(...)
#endif

#ifndef API_DEPRECATED
#   define API_DEPRECATED(...)
#endif

#ifndef API_DEPRECATED_WITH_REPLACEMENT
#   define API_DEPRECATED_WITH_REPLACEMENT(...)
#endif

#ifndef API_UNAVAILABLE
#   define API_UNAVAILABLE(...)
#endif

#pragma mark Unknow
// Introduction version Unknow

#ifndef NS_WARN_UNUSED_RESULT
#   if __has_attribute(warn_unused_result)
#       define NS_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#   else
#       define NS_WARN_UNUSED_RESULT
#   endif
#endif
