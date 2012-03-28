# RFKit
RFKit是为日常iOS开发打造的一个辅助工具库。

支持ARC，同时支持非ARC环境。

## Debug output kit (dout)
如果你喜欢用打印的方式调试程序的话，你会发现 dout 很有用。

以`_dout`开头的宏不起作用，这是为了便于用替换的方式批量控制调试信息的输出。

## 类扩展
### NSObject
* Block支持，基于[BlockKit](https://github.com/zwaldowski/BlocksKit)

### NSString
* reverseString，字符串反转
* stringTrimToWidthLength:WithFont:，将字符串截取为指定长度
	* 注：该方法效率较低

### UIColor
* 用16进制创建UIColor实例

	```
[UIColor colorWithRGBHex:0xFF0000];
[UIColor colorWithRGBString:@"0xFF0000" alpha:0.5f];
```
	
### UIImage
* 通过资源文件名快速创建UIImage实例，例：

	```
	[UIImage resourceName:@"pattern_bg"];
	[UIImage resourceName:@"pattern_bg" ofType:@"jpg"]; // 默认类型为PNG
```
* 改变图像尺寸
	* imageByScalingAndCroppingForSize:
	* imageAspectFillSize: 

### UIView
// need update

## 性能工具
* 打印低阶内存信息

	```
[RFKit logMemoryInfo]
``` 

* Time tracking
	* \- (time_t)addTimePoint:(NSString *)name;
	* \- (float)timeBetween:(NSString *)name1 another:(NSString *)name2;
	
## RFMath
// need update

## 其他工具
* 获取设备Mac地址

	```
[RFKit getMacAddress];
```
