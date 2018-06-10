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

// Xcode 9.3
// SE-0075: #if canImport()
// SE-0190: #if targetEnvironment()

// Xcode 9.0
// SE–0168: multiline string literals """
// SE–0161: type-safe key path literals \BaseType.propertyName
// 7184689: @available in Objective-C
// 21359084: #pragma pack

#pragma mark Xcode 8

#ifndef NS_NOESCAPE
#   if __has_attribute(noescape)
#       define NS_NOESCAPE __attribute__((noescape))
#   else
#       define NS_NOESCAPE
#   endif
#endif

#ifndef NS_STRING_ENUM
#   define NS_STRING_ENUM
#endif

#ifndef NS_EXTENSIBLE_STRING_ENUM
#   define NS_EXTENSIBLE_STRING_ENUM
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

// Xcode 8, with macOS 10.12 and iOS 10 SDK
// https://developer.apple.com/library/content/releasenotes/Miscellaneous/RN-Foundation-OSX10.12/index.html

// Xcode 8.3
// SE-0141, SR-2709: @available

// Xcode 8.1
// 28694859: __weak in MRC
// 26921435: __swift__ macro

// Xcode 8.0
// 23891898: class properties
// SE-0064: property getter or setter in #selector
// SE-0062: #keyPath
// SE-0034: #sourceLocation

#pragma mark Xcode 7

// Xcode 7.0: 19240897
#ifndef NS_SWIFT_NAME
#   define NS_SWIFT_NAME(...)
#endif

// Xcode release note
// https://developer.apple.com/library/content/releasenotes/DeveloperTools/RN-Xcode/Chapters/Introduction.html

// Xcode 7.3
// SE-0020: #if swift
// SE-0028: #file, #line, #column, #function
// SE-0022: #selector

// Xcode 7.0
// 19589424: __kindof

#pragma mark Unknow
// Introduction version Unknow

#ifndef NS_WARN_UNUSED_RESULT
#   if __has_attribute(warn_unused_result)
#       define NS_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#   else
#       define NS_WARN_UNUSED_RESULT
#   endif
#endif
