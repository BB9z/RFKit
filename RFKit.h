/*!
	RFKit
	To be a usefull library for daily iOS develop.
 
	https://github.com/BB9z/RFKit
 
	The MIT License
	http://www.opensource.org/licenses/mit-license.php
*/

#ifndef RFKit_h
#define RFKit_h 0.1.0

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "dout.h"
#import "RFMath.h"

#import "NSObject+RFKit.h"
#import "NSString+RFKit.h"
#import "UIColor+RFKit.h"
#import "UIImage+RFKit.h"
#import "UIView+RFKit.h"


#pragma mark -
#pragma mark ARC Compatible Macro

#if __has_feature(objc_arc)
	#define RF_AUTORELEASE(exp)	exp
	#define RF_RELEASE(exp)		exp
	#define RF_RETAIN(exp)		exp
	#define RF_DEALLOC(exp)		exp

	#define RF_AUTORELEASE_OBJ(obj)
	#define RF_RELEASE_OBJ(obj)
	#define RF_RETAIN_OBJ(obj)
	#define RF_DEALLOC_OBJ(obj)
#else
	#define RF_AUTORELEASE(exp)	[exp autorelease]
	#define RF_RELEASE(exp)		[exp release]
	#define RF_RETAIN(exp)		[exp retain]
	#define RF_DEALLOC(exp)		[exp dealloc]

	#define RF_AUTORELEASE_OBJ(obj)	[obj autorelease];
	#define RF_RELEASE_OBJ(obj)		[obj release];
	#define RF_RETAIN_OBJ(obj)		[obj retain];
	#define RF_DEALLOC_OBJ(obj)		[obj dealloc];
#endif

#ifndef RF_STRONG
	#if __has_feature(objc_arc)
		#define RF_STRONG strong
	#else
		#define RF_STRONG retain
	#endif
#endif

#ifndef RF_WEAK
	#if __has_feature(objc_arc_weak)
		#define RF_WEAK weak
	#elif __has_feature(objc_arc)
		#define RF_WEAK unsafe_unretained
	#else
		#define RF_WEAK assign
	#endif
#endif

#if !__has_feature(objc_arc)
	#define RF_IF_NO_ARC 
	#define RF_IF_NO_ARC_END
#else 
	#define RF_IF_NO_ARC	 if(0){
	#define RF_IF_NO_ARC_END }
#endif

#pragma mark -

@interface RFKit : NSObject{
	time_t timeBase;
}
@property(RF_STRONG) NSMutableDictionary * timeTable;

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


#pragma mark NSArray extension
@interface NSArray (RFKit)
- (id)firstObject;
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
+ (NSString *)pathForMainBoundlePath:(NSString *)path;
@end

#pragma mark UIButton
@interface UIButton (RFKit)

- (void)setResourceImage:(NSString *)imageName background:(NSString *)backGroundImageName;

@end

// compiler sets __ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__ when -miphoneos-version-min is used
//#define __ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__ __IPHONE_4_3
//

#endif

#define RFKit_RUN_ONCE_START \
	static bool RFKit_run_once_flag = false; \
	if (!RFKit_run_once_flag) { \
		RFKit_run_once_flag = true;

#define RFKit_RUN_ONCE_END }
