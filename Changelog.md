# RFKit Changelog

## 2.5.0

* API Enhancements:
  * RFFoundation, add guard define for `TARGET_OS_MACCATALYST`.
  * New UITextField+RFKit, with `trimedText` and `selectedRange`.

## 2.4.0

* Imporve macOS supports.
* Add limited Carthage support.
* iOS minimum deployment version upgrade to 8.0.
* Eliminate warnings when build with latest deployment target version.
* API Changes:
  * NSString+RFKit, remove `containsString:`.
  * UIImage+RFKit, fix duplicate name of `imageWithTintColor:` on iOS 13, rename it to `rf_imageWithTintColor:`.
  * RFFoundation, drop Xcode 7 support.

## 2.3.0

* Fix Xcode 10 warnings.
* Update EXTKeyPathCoding.

## 2.2.1

* API Enhancements:
  * UINavigationController+RFKit, add `removeViewController:animated:`.
* Bug fixes:
  * UINavigationController+RFKit, fix name of `setTopViewController:animated:` in Swift.

## 2.2.0

* API Enhancements:
  * RFFoundation, add guard define for `NS_STRING_ENUM` and `NS_EXTENSIBLE_STRING_ENUM`.
  * dout, add `RFDebugger()` as an alternative to Debugger().
  * New UIPickerView+RFKit, with `rf_selectRow:inComponent:animated:`.

## 2.1.0

* **Breaking Changes:**
  * Subspec RFKit/Category/UIAlertView is no longer included by default.
* API Enhancements:
  * NSArray+RFKit, add `rf_mapedArrayWithBlock:`.
* Bug fixes:
  * Version in RFKit.h not bumped.

## 2.0.1

* Bug fixes:
  * Eliminate warning when 'DEBUG' is not defined.

## 2.0

* Highlighted enhancements:
  * Better Swift support. APIs now have delight and clean names. Closure are flagged no escape when necessary. Methods are defined as properties when necessary.
* **Breaking Changes:**
  * All deprecated code is removed, which includes:
    * `RF_NOESCAPE`, `RF_WARN_UNUSED_RESULT`.
    * UncaughtExceptionHandler.
    * RFPerformance time methods.
    * Some methods in categories.
  * Many APIs had renamed in Swift.
  * Xcode 7 support dropped.
* API Enhancements:
  * RFGeometry, add `UIEdgeInsetsMakeWithSameMargin` and `UIEdgeInsetsReverse`.
  * RFRuntime, make some UI types available on a macOS target.
  * dout, geometry methods now can print variable struct not just the CG or NS type.
  * NSDictionary+RFKit, add `addEntriesFromDictionary:filterKeys:` as withSpecifiedKeys version is unavailable in Swift.
  * UIView+RFKit, add `UIViewAutoresizingFlexibleSize` and `UIViewAutoresizingFlexibleMargin`.
* Bug fixes:
  * RFDispatch, fix wrong available version.
  * RFFoundation, fix TARGET_OS_OSX define on watchOS target.
  * NSDictionary+RFKit, fix type define. Fix `addEntriesFromDictionary:withSpecifiedKeys:` return wrong number if there are duplicate keys.
* Project:
  * Now have a Swift test.
  * Move doc to wiki.
  * CI with matrix.
