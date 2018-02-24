/*!
    RFPerformance
    RFKit

    Copyright (c) 2012-2013, 2015-2016, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
*/

#import "RFRuntime.h"


#ifndef RFAlloctionLog
#   define RFAlloctionLog \
    + (id)alloc {\
        id var = [super alloc];\
        NSLog(@"%@ alloc >> %p", [self class], (__bridge void *)var);\
        return var;\
    }\
    - (void)dealloc {\
        NSLog(@"%@ dealloc << %p", [self class], (__bridge void *)self);\
    }
#endif

#ifndef _RFAlloctionLog
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-id-macro"
#   define _RFAlloctionLog
#pragma clang diagnostic pop
#endif

@interface RFPerformance : NSObject
@property NSMutableDictionary *timeTable DEPRECATED_ATTRIBUTE;

+ (RFPerformance *)sharedInstance DEPRECATED_MSG_ATTRIBUTE("No singleton");

/// Print menory usage details
+ (void)logMemoryInfo;

/** @name 计时器 */
#pragma mark Timer

/** 增加给定名称的时间点
 
 @param name Name of the time point
 @return 当前时间
 */
- (time_t)addTimePoint:(NSString *)name DEPRECATED_ATTRIBUTE;


/** 返回两个时间点间的时间差
 
 参数不分先后
 
 @param name1 一个点的名字
 @param name2 另一点的名字
 @return 两点间时间差，单位秒
 */
- (float)timeBetween:(NSString *)name1 another:(NSString *)name2 DEPRECATED_ATTRIBUTE;

@end
