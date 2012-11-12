RFKit Document
=================
RFKit 包含一套对日常iOS开发很有帮助的工具。

dout
------
dout为调试打印而生，它包含了一套方便打印工具。

特色：

* 打印变量会在结果前添加打印的表达式。

  如：

  ```
int a = 10;
dout_int(101+a)	// Output: 101+a = 111
  ```

* 支持打印语句本身的跟踪，开启 `DOUT_FALG_TRACE` 以激活。 
* 专用于警告、错误输出的语句，可配置为抛出异常或断言失败。
* 因为是宏，当禁用时通常不会有性能损失。

详见：[dout 文档](https://github.com/BB9z/RFKit/blob/master/doc/dout.md)


UIKit & Foundation Categories 
-------------
UIKit 和 Foundation 的扩展是 RFKit 的重要组成部分，包含了很多实用方法。

`RFKitDefaultCategories.h` 定义了默认包含的扩展。

每个扩展的具体功能见头文件。


RFRuntime
-------------
处理编译/运行时差异，为上层组件提供统一、简单的界面。

其中，RFARC专用于处理ARC的兼容，借助 `RF_STRONG`、`RF_WEAK` 等宏可以写出同时兼容ARC和非ARC环境的代码。iOS6后，ARC增加了对GCD的支持，随之又增加了 `RF_dispatch_retain` 和 `RF_dispatch_release`。

RFRuntime 默认包括了 UIKit 和 Foundation 头文件。


RFGeometry
-------------
为 `CGPoint`、`CGSize`、`CGRect` 等几何结构增加了新的方法，增加了新的 `CGAngle` 角度结构。

`RFResizeAnchor` 和 `RFAlignmentAnchor` 为尺寸调整、对齐提供参考基准。  


其他
-------------
external 文件夹下存放其他外部组件。

UncaughtExceptionHandler，一般用于内部测试，调用 `InstallUncaughtExceptionHandler()` 激活后，可以捕获到应用运行时的错误，帮助在非调试环境确定问题所在。