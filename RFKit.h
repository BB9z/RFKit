/*!	RFKit
 
 
 Readme
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

+ (RFKit *)sharedKit;

// 返回机器网卡物理地址
// @REF http://iphonedevelopertips.com/device/determine-mac-address.html
+ (NSString *)getMacAddress;

// 打印内存信息
// @REF http://www.keakon.net/2011/08/12/获取iOS设备的内存状况
+ (void)logMemoryInfo;


/** This is the second super-awesome method.
 
 Note that there are additional cool things here, like [direct hyperlinks](http://www.cocoanetics.com)
 
 @param number A parameter that is passed in, almost as cool as someMethodWithString:
 @return Whatever it returns.
 @see someMethodWithString:
 @warning *Warning:* A blue background.
 @bug *Bug:* A yellow background.
 */
+ (void)rls:(id)first,...;
	


#pragma mark 计时器

// 增加给定名称的时间点
- (time_t)addTimePoint:(NSString *)name;

// 返回两个时间点间的时间差
// 参数不分先后
- (float)timeBetween:(NSString *)name1 and:(NSString *)name2;
@end

#pragma mark -
#pragma mark NSString 扩展
@interface NSString (extension)

// NSString 反转
// @TEST OK
- (NSString *)reverseString;

- (NSString *)trimStringToWidthLength:(CGFloat)length WithFont:(UIFont *)font;
@end

#pragma mark NSDateFormatter 扩展
@interface NSDateFormatter (extension)

+ (NSDateFormatter *)GMTFormatter;
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