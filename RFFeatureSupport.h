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

// We purposefully don't have a matching @implementation.
// We don't want +asNonnull to ever actually be called
// because that will add a lot of overhead to every RBBNotNil
// and we want RBBNotNil to be very cheap.
// If there is no @implementation, then if the +asNonnull is
// actually called, we'll get a linker error complaining about
// the lack of @implementation.
@interface RF_NONNULL <__covariant Type>
// This as a class method so you don't need to
// declare an unused lvalue just for a __typeof
+ (Type _Nonnull)asNonnull;
@end

/**
 @define RF_AS_NONNULL(V)
 
 Converts an Objective-C object expression from _Nullable to _Nonnull.
 
 Crashes if it receives a nil! We must crash or else we'll receive static analyzer warnings when archiving. I think in Release mode, the compiler ignores the _Nonnull cast.
 
 @param V a _Nullable Objective-C object expression
 
 @ref https://gist.github.com/robb/d55b72d62d32deaee5fa
 */
#if DEBUG
#define RF_AS_NONNULL(V) \
({\
    __typeof__(V) __nullableV = V;\
    NSCAssert(__nullableV, @"Expected '%@' not to be nil.", @#V);\
    (__typeof([RF_NONNULL<__typeof(V)> asNonnull]))__nullableV;\
})
#else
#define RF_AS_NONNULL(V) \
    (__typeof([RF_NONNULL<__typeof(V)> asNonnull]))V
#endif


#pragma mark - SDK backward compatibility

#pragma mark Xcode 9

// Memo:
// 7184689: @available in Objective-C

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

#ifndef TARGET_OS_OSX
#   define TARGET_OS_OSX (TARGET_OS_MAC && !TARGET_OS_IOS)
#endif

// Memo:
// 23891898: class properties
// 26921435: __swift__ macro
// 28694859: __weak in MRC

#pragma mark Xcode 7

// Xcode 7: 19240897
#ifndef NS_SWIFT_NAME
#   define NS_SWIFT_NAME(...)
#endif

// Xcode release note
// https://developer.apple.com/library/content/releasenotes/DeveloperTools/RN-Xcode/Chapters/Introduction.html

#pragma mark Unknow
// Introduction version Unknow

#ifndef NS_WARN_UNUSED_RESULT
#   if __has_attribute(warn_unused_result)
#       define NS_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#   else
#       define NS_WARN_UNUSED_RESULT
#   endif
#endif
