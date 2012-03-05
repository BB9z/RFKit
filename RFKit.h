/*!
	RFKit
	To be a usefull library for daily iOS develop.
 
*/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "dout.h"
#import "RFMath.h"

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


/** Print menory usage details
 
 via http://www.keakon.net/2011/08/12/获取iOS设备的内存状况
 */
+ (void)logMemoryInfo;


/** Tradition object release helper
 
Before we write:
 
	［object1 release];
	［object2 release];
	［object3 release];
 
Now:
 
	［RFKit rls:object1, object2, object3];
 
 @param first at least one object
 @param ... other objects to realse
 */
+ (void)rls:(id)first,...;


/** @name 计时器 */
#pragma mark Timer

/** 增加给定名称的时间点
 
 @param name Name of the time point
 @return 当前时间
 */
- (time_t)addTimePoint:(NSString *)name;


/** 返回两个时间点间的时间差
 
 参数不分先后
 
 @param name1 一个点的名字
 @param name2 另一点的名字
 @return 两点间时间差，单位秒
 */
- (float)timeBetween:(NSString *)name1 another:(NSString *)name2;
@end

#pragma mark -
#pragma mark NSObject 扩展
@interface NSObject (extension)

- (void)defaultFill:(id)test with:(id)value;

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


#pragma mark NSDictionary 扩展
@interface NSDictionary (extension)
- (id)objectForKey:(id)aKey defaultMarker:(id)anObject;
@end


#pragma mark NSDateFormatter 扩展
@interface NSDateFormatter (extension)
/** 符合GMT格式的NSDateFormatter
 
 日期格式为 yyyy-MM-ddT HH:mm:ssZ
 @return GMTFormatter
 */
+ (NSDateFormatter *)GMTFormatter;

+ (NSDateFormatter *)currentLocaleFormatter;
+ (NSDateFormatter *)currentLocaleFormatterOnlyDate;

@end


#pragma mark UIView 扩展
@interface UIView (extension)
- (UIImage *)renderToImage;

/** Exchange a UIView`s width and Hight
 */
- (void)exhangeWidthHight;


/** Move a UIView relative to it`s position.
 
 @param x	X-axis distance to move
 @param y	Y-axis distance to move
 @see [UIView (extension) moveToX:Y:]
 */
- (void)moveX:(CGFloat)x Y:(CGFloat)y;


/** Move a UIView relative to it`s 
 
This method use frame setting new position. Set parameter equal to CGFLOAT_MAX if you don`t want move in that direction. 
 
 @param x	New position on x-axis
 @param y	New position on y-axis
 @see  [UIView (extension) moveX:Y:]
 */
- (void)moveToX:(CGFloat)x Y:(CGFloat)y;


/** Resize a UIView
 
 Set parameter equal to CGFLOAT_MAX if you don`t want resize that direction.
 
 @param width	New width
 @param height	New height
 */
- (void)resizeWidth:(CGFloat)width height:(CGFloat)height;


- (void)removeAllSubviews;

- (void)bringAboveView:(UIView *)aView;
- (void)bringToFront;
- (void)sentBelowView:(UIView *)aView;
- (void)sentToBack;

- (void)bringOneLevelUp;
- (void)sendOneLevelDown;

- (BOOL)isInFront;
- (BOOL)isAtBack;

- (void)exchangeDepthsWithView:(UIView *)swapView;
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
+ (UIImage *)resourceName:(NSString *)fileName ofType:(NSString *)type;

// @REF: http://stackoverflow.com/a/605385/945906
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)imageAspectFillSize:(CGSize)targetSize;
@end

#pragma mark -
#pragma mark 其他
