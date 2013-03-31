RFKit Document
=================
<base href="//github.com/BB9z/RFKit/blob/master/" />
<small>*English :us:* [简体中文 :cn:](README~zh-hans.md)</small>

RFKit was a useful toolkit for daily iOS development.


dout
------
dout contains a set of convenient log toolcha, which was designed for debugging.

Features:

* Auto add expression before the results.

  e.g.:

  ```
int a = 10;
dout_int(101+a)	// Output: 101+a = 111
  ```

* Support add position information in log output to help tracking location of log statements. Set `DOUT_FALG_TRACE` as `1` to active. 
* Special log methods for warning and error. Can change theirs behave to throw exception or assert fail.
* As macro, usually no performance loss.

Details: [dout Document](doc/dout.md)


RFRuntime
-------------
Handle build or runtime differences. Provides an unified and simple interface for upper components. Contains：debugging switch define, default header file, RFARC and language extensions.

### Debug switch
`RFDEBUG`, RFKit debug mode switch. Set as `1` to active. If it´s not defined, will defined as `1` when `DEBUG` is true and `NDEBUG` not defined.

`RFDebugLevel`, controlling debugging behavior. If it´s not defined, will be defined as `2` if `RFDEBUG` is true, otherwise `1`.

### Default header file
UIKit and Foundation header is included in RFRuntime by default.

### RFARC
Dedicated to processing the ARC's compatible. One can write code which is compatible with the ARC and non-ARC environment with `RF_STRONG` and `RF_WEAK`. As ARC support GCD after iOS 6, `RF_dispatch_retain` and `RF_dispatch_release` were added.

### Language extensions
* @keypath，key path completing helper. Convert input to key path string, for example:

	Suppose there are `UIViewController *a`. To observer `frame` changes of the view using KVO, we can write like:

	```
[a addObserver:someObject forKeyPath:@"view.frame" options:NSKeyValueObservingOptionNew context:NULL];
	```
	
	The key path was hard-coded here which cause much inconvenience. Using `@keypath` we can write like:

	```
[a addObserver:someObject forKeyPath:@keypath(a, view.frame) options:NSKeyValueObservingOptionNew context:NULL];
	```

	Compiler can check it, and code completion support these property now.


UIKit & Foundation Categories 
-------------
Important part of RFKit. They contains many useful methods.

`RFKitDefaultCategories.h` defends which extension is imported by default.

See each header file to know the specific features.


RFGeometry
-------------
Add new methods for geometry structures: `CGPoint`, `CGSize`, `CGRect`. Add an new `CGAngle` angle structure.

`RFResizeAnchor` and `RFAlignmentAnchor` provides a reference for resizing and aligning.


Others
-------------
Some external components were placed under `external` folder.

UncaughtExceptionHandler, generally used for internal testing. Call  `InstallUncaughtExceptionHandler()` to active. It catch errors at runtime to determine problems in non-debug environment.