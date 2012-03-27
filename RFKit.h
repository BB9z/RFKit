/*!
	RFKit
	To be a usefull library for daily iOS develop.
 
*/

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "dout.h"
#import "RFMath.h"

#import "NSObject+RFKit.h"
#import "NSString+RFKit.h"
#import "UIColor+RFKit.h"
#import "UIImage+RFKit.h"

typedef enum {
	RFViewResizeOptionNone		= 0,
	RFViewResizeOptionFill		= 1,
	RFViewResizeOptionAspectFill= 2,
	RFViewResizeOptionAspectFit	= 3,
	RFViewResizeOptionOnlyWidth	= 6,
	RFViewResizeOptionOnlyHeight= 7,
	RFViewResizeOptionCenter	= 11,
} RFViewResizeOption;


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
 
	［RFKit rls:object1, object2, object3, nil];
 
 @param first at least one object
 @param ... other objects to realse
 */
/// Deprecated
+ (void)rls:(id)first,...;

+ (void)performBlock:(void (^)(id))block afterDelay:(NSTimeInterval)delay on:(id)object,...;


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

@interface UIView (RFKit)
- (BOOL)isVisible;

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

- (void)addSubview:(UIView *)view frame:(CGRect)rect;
- (void)addSubview:(UIView *)view resizeOption:(RFViewResizeOption)option;
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

#pragma mark UIButton
@interface UIButton (RFKit)

- (void)setResourceImage:(NSString *)imageName background:(NSString *)backGroundImageName;

@end

// compiler sets __ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__ when -miphoneos-version-min is used
//#define __ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__ __IPHONE_4_3
//

