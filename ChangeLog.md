RFKit Change Log
================

1.3
-----
* Add some components from libextobjc (https://github.com/jspahrsummers/libextobjc). Includes: EXTKeyPathCoding, EXTScope, EXTSwizzle, metamacros.h. But EXTSwizzle is not included by default.
* dout 2.0. New dout_hex(). Using printf instead of NSLog when be debugging for better output format (and faster). Define RFDebugLevel as enum and move to RFRuntime.h now.
* Unit test project.
* Change UIButton and UITableView category included by default.
* RFGeometry improve: CGPointNotChange, CGRectNotChange, CGSizeNotChange and CGRectMakeWithCenterAndSize().
* New RFDispatch. GCD helper.
* New UISearchBar category.
* NSBundle change: Deprecate versionString class method, use instance method instead.
* Various API improve:
  - NSDate+RFKit, add daysBetweenDate:andDate: and two other methods to generate specified date.
  - NSDateFormatter+RFKit, add two helper method to get specified formatter.
  - UIButton+RFKit, add method to change exist button background image to be resizable.
  - UIDevice+RFKit, debugger detection.
  - UIImage+RFKit, add several method to resize a image.
  - UITableView+RFKit, add a dequeue helper method.
  - UIView+RFAnimate, better KVO support, add size property.
  - UIView+RFKit, add helper method to load a view from nib. Add a method to get view controller. New sizeToFitSuperview method.
  - UIViewController+RFKit, new rootViewControllerWhichCanPresentModalViewController. Implementation optimize.
* Various warning fix and refactoring.

1.2
-----
* Receive RFFeatureSupport from RFUI/Core. Imported by RFRuntime default.
* Class methods in UIDevice category was deprecated, new instance methods added.
* UIView has a powerful method - isVisible.
* Remove CGRectIsOutOfRect().
* Add UIView+RFAnimate category.
* NSJSONSerialization category add a parameter simplify method
 JSONObjectWithString:.
* Add method to deselect all selected rows for UITableView.

1.1
-----
* Hello 2013~
* Eliminate warnings.
* dout 1.3.0.
* New NSJSONSerialization, UIWebView, UIStoryboard extensions.
* @keypath.
* Document improve.

1.0
-----
* Add Chinese document.