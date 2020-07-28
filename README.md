# RFKit

[![Build Status](https://img.shields.io/travis/BB9z/RFKit.svg?style=flat-square&colorA=333333&colorB=6600cc)](https://travis-ci.com/BB9z/RFKit)
[![Codecov](https://img.shields.io/codecov/c/github/BB9z/RFKit.svg?style=flat-square&colorA=333333&colorB=6600cc)](https://codecov.io/gh/BB9z/RFKit)
[![CocoaPods](https://img.shields.io/cocoapods/v/RFKit.svg?style=flat-square&colorA=333333&colorB=6600cc)](https://cocoapods.org/pods/RFKit)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-6600cc.svg?style=flat-square&colorA=333333)](https://github.com/Carthage/Carthage)

<base href="//github.com/BB9z/RFKit/blob/master/" />

<small>*English* [简体中文 :cn:](README~zh-hans.md)</small>

RFKit is a useful toolkit for daily Cocoa development.

## Requirements

| RFKit Version | Minimum Xcode Version | Minimum iOS Target  | Minimum macOS Target | Minimum watchOS Target | Minimum tvOS Target |
|:-------------:|:---------------------:|:-------------------:|:--------------------:|:----------------------:|:-------------------:|
| 2.5             | Xcode 9               | iOS 9  | macOS 10.9  | watchOS 2.0 | tvOS 9.0 |
| 2.4             | Xcode 8               | iOS 8  | macOS 10.8  | watchOS 2.0 | tvOS 9.0 |
| 2.0-2.3       | Xcode 8               | iOS 6  | macOS 10.8  | watchOS 2.0 | tvOS 9.0 |
| 1.7             | Xcode 7               | iOS 6  | macOS 10.8  | watchOS 2.0 | tvOS 9.0 |
| 1.6             | Xcode 8               | iOS 6  | N/A         | watchOS 2.0 | N/A      |

## Install

### CocoaPods

To install using CocoaPods, add the following to your project Podfile:

```ruby
pod 'RFKit'
```

Specify develop branch to install the lastest version:

```ruby
pod 'RFKit', :git => 'https://github.com/BB9z/RFKit.git', :branch => 'develop'
```

A more complex sample:

```ruby
pod 'RFKit',
    :git => 'https://github.com/BB9z/RFKit.git',
    :branch => 'develop',
    :subspecs => ['Default', 'Category/NSDateFormatter']
```

### Carthage

Although I recommend using CocoaPods, Carthage is still supported.

Specify RFKit in your Cartfile:

```text
github "BB9z/RFKit"
```

Or use lastest version:

```
github "BB9z/RFKit" "develop"
```

### Manual

You can always import RFKit by adding source code into your project. Just copy any files you needs.

## dout

dout contains a set of convenient log toolcha, which was designed for debugging.

Features:

* Out out format is better than NSLog(), and more faster.
* Auto add expression before the results.

  e.g.:

  ```c
  int a = 10;
  dout_int(101+a)  // Output: 101+a = 111
  ```

* Optimized for multiple threads debugging, you can easily find the output come from which thread.
* Support add position information in log output to help tracking location of log statements. Set `DOUT_FALG_TRACE` as `1` to active. 
* Special log methods for warning and error. Can change theirs behave to throw exception or assert fail.
* Behavior can be highly customizable through the switch.
* As macro, usually no performance loss.

Details: [dout Document(in Chinese)](https://github.com/BB9z/RFKit/wiki/dout)

## RFRuntime

Handle build or runtime differences. Provides an unified and simple interface for upper components. Contains：debugging switch define, default header file, RFARC and language extensions.

### Debugging switch

`RFDEBUG`, RFKit debug mode switch. Set as `1` to active. If it´s not defined, will defined as `1` when `DEBUG` is true and `NDEBUG` not defined.

`RFDebugLevel`, controlling debugging behavior. If it´s not defined, will be defined as `2` if `RFDEBUG` is true, otherwise `1`.

### Default header file

UIKit and Foundation header is included in RFRuntime by default.

### RFFeatureSupport

Defined some fake protocols for declaring a class support something or not.

### RFDispatch

Some helper function for GCD.

### Language extensions

Include some components from [libextobjc](https://github.com/jspahrsummers/libextobjc):

* metamacros.h, macros for metaprogramming.
* EXTKeyPathCoding, allows compile-time verification of key paths.
* EXTScope, several tools relative to scope.

@keypathClassInstance is similar with @keypath, but accept a class as parameter instead of a instance variable.

## UIKit & Foundation Categories

Important part of RFKit. They contains many useful methods.

`RFKitDefaultCategories.h` defends which extension is imported by default.

See each header file to know the specific features.

## RFGeometry

Add new methods and constants for geometry structures: `CGPoint`, `CGSize`, `CGRect`. Add an new `CGAngle` angle structure.

`RFResizeAnchor` and `RFAlignmentAnchor` provides a reference for resizing and aligning.

## RFPerformance & doutkit

Performance toolkit.

## Others

Some external components were placed under `external` folder.

[Change log](https://github.com/BB9z/RFKit/releases)
