/*!
 RFFoundation
 RFKit
 
 Copyright (c) 2018-2020 BB9z
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

#pragma mark Xcode 11

// Xcode 11.4
// https://developer.apple.com/documentation/xcode_release_notes/xcode_11_4_release_notes
// XCTSkipIf, XCTSkipUnless
// simctl privacy

// Xcode 11.2
// https://developer.apple.com/documentation/xcode_release_notes/xcode_11_2_release_notes
// simctl list json

// Xcode 11
// https://developer.apple.com/documentation/xcode_release_notes/xcode_11_release_notes
// SwiftUI
// Working with Swift packages
// Mac Catalyst
// Dark Mode on iOS
// XCFramework (BUILD_LIBRARY_FOR_DISTRIBUTION)
// xcrun altool
// __DATA_CONST segment
// SCRIPT_INPUT_FILE_# environment variables
// LLDB’s Python scripting is now based on Python 3
// IBSegueAction (objc), @IBSegueAction (Swift)
// new Apple Development and Apple Distribution certificate types
// SE-0260: @frozen attribute for structures and enumerations
// SE-0242: structures initializer provides default values
// SR-2688: @autoclosure in type alias
// SR-7601: @objc methods can return Self
// SE-0254: type subscripts
// SE-0068: Self can use in more places
// XCTUnwrap

#ifndef TARGET_OS_MACCATALYST
#   define TARGET_OS_MACCATALYST 0
#endif

#pragma mark Xcode 10

// Xcode 10.2
// https://developer.apple.com/documentation/xcode_release_notes/xcode_10_2_release_notes
// You can now use $0, $1, … shorthands in LLDB expression evaluation inside closures. (20719448)
// Swift 5
// SE-0200: String literals can now be expressed using enhanced delimiters
// SE-0216: @dynamicCallable
// SE-0227: Key paths now support the identity keypath (\.self)
// SE-0235: STD Result enumeration
// SE-0219: SPM dependency mirror

// Xcode 10
// https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes
// C++17 headers
// new build system
// Dark Mode on macOS
// Xcode Localization Catalog (.xcloc)
// xcodebuild support uploading apps
// Swift 4.2
// SE-0196: compile-time #warning(_:) and #error(_:)
// SE-0193: @inlinable, @usableFromInline
// STD Hasher
// Running tests in parallel

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
