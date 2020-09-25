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

#pragma mark Xcode 12

// 18389814: SVG image, requires macOS 10.15+, iOS 13+
// 64910707: XCFrameworks can now include .dSYM and .bcsymbolmap
// IBDesignable improvements
// 54356464: The linker now supports @filename response files
// 60089627: Xcode Playgrounds can now build the active scheme’s targets and make them importable
// 60612584: Xcode Playgrounds can now import and use Swift packages and frameworks
// 40237402: You can now declare conditions for a Swift package’s target dependencies
// 54361843: Swift packages can now contain resources such as images, asset catalogs, storyboards, and other files
// 56592977: Swift packages can now vend prebuilt libraries distributed as XCFrameworks
// 56925255: Swift packages can now contain localized content for any resource in the package
// 28547702: New XCTIssue
// 54721394: XCTApplicationLaunchMetric can now measure application launch to first frame
// Many others XCTest improvements

// Swift 5.3
// SE-0269: Swift now allows the implicit use of self in @escaping closures when reference cycles are unlikely to occur
// 59471019: A property with an attached property wrapper can now rely on type inference to infer the wrapped value type
// Support using @main in place of @UIApplicationMain or @NSApplicationMain
// 64229062: lazy properties may now have didSet and/or willSet observers.
// SE-0285: #fileID identifier which produces a shorter string than #file
// SE-0279: Multiple Trailing Closures
// SE-0286: Forward-scan matching for trailing closures

#pragma mark Xcode 11

// Xcode 11.4
// https://developer.apple.com/documentation/xcode_release_notes/xcode_11_4_release_notes
// Swift 5.2
// XCTSkipIf, XCTSkipUnless
// simctl privacy

// Xcode 11.2
// https://developer.apple.com/documentation/xcode_release_notes/xcode_11_2_release_notes
// simctl list json

// Xcode 11
// https://developer.apple.com/documentation/xcode_release_notes/xcode_11_release_notes
// Swift 5.1
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
