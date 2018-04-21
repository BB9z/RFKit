/*!
    RFFoundation
    RFKit

    Copyright (c) 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#pragma once

/**
 Besides import NSFoundation header, the main purpose of this file is to allow the library to be compiled on a lower version of Xcode by providing definitions that are only available in an new version of the SDK.
 
 This file should be included by all files of RFKit.
 */
#import <Foundation/Foundation.h>

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
#   define TARGET_OS_OSX (TARGET_OS_MAC && !TARGET_OS_IPHONE)
#endif

#ifndef TARGET_OS_TV
#   define TARGET_OS_TV 0
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
