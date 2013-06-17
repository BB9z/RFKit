RFKit Document
=================
<base href="//github.com/BB9z/RFKit/blob/master/" />
<small>[English :us:](README.md) *简体中文 :cn:*</small>

RFKit 包含一套对日常iOS开发很有帮助的工具。

dout
------
dout为调试打印而生，它包含了一套方便打印工具。

特色：

* 比 NSLog() 更好的输出格式，并且更快。
* 打印变量会在结果前添加打印的表达式。

  如：

  ```
int a = 10;
dout_int(101+a)	// Output: 101+a = 111
  ```

* 为多线程调试优化，可以直观看到语句是在哪个线程输出。
* 支持在输出中添加打印语句位置信息以便于定位打印语句的位置，开启 `DOUT_FALG_TRACE` 以激活。 
* 专用于警告、错误输出的语句，可配置为抛出异常或断言失败。
* 行为可通过开关高度定制。
* 因为是宏，当禁用时通常不会有性能损失。

详见：[dout 文档](doc/dout.md)


RFRuntime
-------------
处理编译/运行时差异，为上层组件提供统一、简单的界面。包含：调试开关定义，默认头文件，RFARC，语言扩展。

### 调试开关
`RFDEBUG`， RFKit 调试模式开关，为 `1` 时启用。若未定义，当 `DEBUG` 为真且未定义 `NDEBUG` 将自动定义为 `1`。

`RFDebugLevel`，调试行为级别控制。若未定义，当 `RFDEBUG` 为真时自动定义为 `2`，否则为 `1`。

### 默认头文件
RFRuntime 默认包括了 UIKit 和 Foundation 头文件。

### RFARC
专用于处理ARC的兼容，借助 `RF_STRONG`、`RF_WEAK` 等宏可以写出同时兼容ARC和非ARC环境的代码。iOS6后，ARC增加了对GCD的支持，随之又增加了 `RF_dispatch_retain` 和 `RF_dispatch_release`。

### RFFeatureSupport
定义了一些伪协议用来标记一个类支持或不支持某些特性。

### RFDispatch
一些 GCD 便捷方法。

### 语言扩展
包括几个来自 [libextobjc](https://github.com/jspahrsummers/libextobjc) 的组件：
* metamacros.h，支持元编程的工具宏。
* EXTKeyPathCoding，key path 自动完成辅助工具。
* EXTScope，与作用域相关的几个实用工具。
* EXTSwizzle，method swizzle，默认没有被包含。

@keypathClassInstance 与 @keypath 类似，直接使用类而无需额外的实例变量。

UIKit & Foundation Categories 
-------------
UIKit 和 Foundation 的扩展是 RFKit 的重要组成部分，包含了很多实用方法。

`RFKitDefaultCategories.h` 定义了默认包含的扩展。

每个扩展的具体功能见头文件。


RFGeometry
-------------
为 `CGPoint`、`CGSize`、`CGRect` 等几何结构增加了新的方法、常量，增加了新的 `CGAngle` 角度结构。

`RFResizeAnchor` 和 `RFAlignmentAnchor` 为尺寸调整、对齐提供参考基准。  


其他
-------------
external 文件夹下存放其他外部组件。

UncaughtExceptionHandler，一般用于内部测试，调用 `InstallUncaughtExceptionHandler()` 激活后，可以捕获到应用运行时的错误，帮助在非调试环境确定问题所在。