/*!
    RFPerformance
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
*/


#import "RFRuntime.h"



#ifndef RFAlloctionLog
#   define RFAlloctionLog \
    + (id)alloc {\
        id var = [super alloc];\
        NSLog(@"%@ alloc >> %p", [self class], var);\
        return var;\
    }\
    - (void)dealloc {\
        NSLog(@"%@ dealloc << %p", [self class], self);\
        RF_DEALLOC_OBJ(super)\
    }
#endif

#ifndef _RFAlloctionLog
#   define _RFAlloctionLog
#endif


@interface RFPerformance : NSObject
@property(RF_STRONG) NSMutableDictionary * timeTable;

+ (RFPerformance *)sharedInstance;

/// Print menory usage details
//! via http://www.keakon.net/2011/08/12/获取iOS设备的内存状况
+ (void)logMemoryInfo;

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
