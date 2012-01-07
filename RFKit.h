/*!
 
 RFKit - To be a usefull library for daily iOS develop.
 


 SystemConfiguration.framework NEEDED
 
*/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "dout.h"

@interface RFKit : NSObject{
	time_t timeBase;
	NSMutableDictionary * timeTable;
}
@property(retain) NSMutableDictionary * timeTable;

/** Returns the shared RFKit object.
 
  @return The shared RFKit object.
 */
+ (RFKit *)sharedKit;

/** Get device's mac address
 
 via: http://iphonedevelopertips.com/device/determine-mac-address.html
 
 @return mac address
 */
+ (NSString *)getMacAddress;

// 打印内存信息
// @REF http://www.keakon.net/2011/08/12/获取iOS设备的内存状况
+ (void)logMemoryInfo;


/** Object release helper
 
 这是一个内存管理辅助函数
 
 释放多个对象的传统的写法：
 
	［object1 release];
	［object2 release];
	［object3 release];
 
 现在，只需写成：
 
	［RFKit rls:object1, object2, object3];
 
 @param first at least one object
 @param ... other objects to realse
 */
+ (void)rls:(id)first,...;
	

#pragma mark Timer
/** ------------------
 * @name 计时器
 * ---------------------
 */

/** 增加给定名称的时间点
 
 @param name Name of the time point
 @return 当前时间
 
 @test pass
 */
- (time_t)addTimePoint:(NSString *)name;

/** 返回两个时间点间的时间差
 
 参数不分先后
 
 @param name1 一个点的名字
 @param name2 另一点的名字
 @return 两点间时间差，单位秒
 */
- (float)timeBetween:(NSString *)name1 and:(NSString *)name2;
@end

#pragma mark -
#pragma mark NSString 扩展
@interface NSString (extension)

/** Reverse a NSString
 
 @return String reversed
 */
- (NSString *)reverseString;

/** 给定字体，屏幕长度，将字符串截断到指定长度
 
 这个方法不改变原始字符串
 @param length 屏幕长度
 @param font 计算所用字体
 @return 符合长度的字符串
 */
- (NSString *)stringTrimToWidthLength:(CGFloat)length WithFont:(UIFont *)font;
@end

#pragma mark NSDateFormatter 扩展
@interface NSDateFormatter (extension)
/** 符合GMT格式的NSDateFormatter
 
 日期格式为 yyyy-MM-ddT HH:mm:ssZ
 @return GMTFormatter
 */
+ (NSDateFormatter *)GMTFormatter;

/** This is the first super-awesome method.
 
 You can also add lists, but have to keep an empty line between these blocks.
 
 - One
 - Two
 - Three
 
 @return Whatever it returns.
 */
+ (NSDateFormatter *)currentLocaleFormatter;
+ (NSDateFormatter *)currentLocaleFormatterOnlyDate;

@end



#pragma mark UIView 扩展
@interface UIView (extension)
- (UIImage *)renderToImage;

// 互换宽高

- (void)exhangeWidthHight;

- (void)moveX:(CGFloat)x Y:(CGFloat)y;
- (void)moveToX:(CGFloat)x Y:(CGFloat)y;


- (void)bringToFront;
- (void)sentToBack;

- (void)bringOneLevelUp;
- (void)sendOneLevelDown;

- (BOOL)isInFront;
- (BOOL)isAtBack;

- (void)exchangeDepthsWithView:(UIView*)swapView;
@end

#pragma mark UIViewController 扩展
@interface UIViewController (extension)
- (void)setNavTitle:(NSString *)title back:(NSString *)backTitle;
@end


#pragma mark NSFileManager 扩展
@interface NSFileManager (extension)
- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError **)erro;
@end

#pragma mark NSBundle 扩展
@interface NSBundle (extension)
+ (NSString *)mainBundlePathForCaches;
+ (NSString *)mainBundlePathForPreferences;
+ (NSString *)mainBundlePathForDocuments;
+ (NSString *)mainBundlePathForTemp;
@end

#pragma mark UIImage 扩展
@interface UIImage (extension)
+ (UIImage *)resourceName:(NSString *)PNGFileName;
// @REF: http://stackoverflow.com/a/605385/945906
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)imageAspectFillSize:(CGSize)targetSize;
@end

#pragma mark -
#pragma mark 其他