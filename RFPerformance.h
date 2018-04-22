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

/// Print menory usage details
+ (void)logMemoryInfo;

@end
