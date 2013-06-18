//
//  DoutTests.m
//  RFKit
//
//  Created by BB9z on 13-6-16.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "DoutTests.h"
#import "dout.h"

#define kPerformanceLoopTime 1000
#define RFDebugLevel RFDebugLevelVerbose

@implementation DoutTests

- (void)testPerformance {
    int i;
    
    NSTimeInterval a = [NSDate timeIntervalSinceReferenceDate];
    for (i = kPerformanceLoopTime; i > 0; i--) {
        NSLog(@"%d", i);
    }
    
    NSTimeInterval b = [NSDate timeIntervalSinceReferenceDate];
    for (i = kPerformanceLoopTime; i > 0; i--) {
        dout_int(i);
    }
    NSTimeInterval c = [NSDate timeIntervalSinceReferenceDate];

    dout(@"NSLog time: %f", b-a)
    dout(@"dout time: %f", c-b)
    dout(@"%.2f faster", (b-a)/(c-b))
}

- (void)testSyntax {
    NSString *str1 = @"foo";
    int a = 999;
    
    dout(@"%@, %d", str1, a)
    douts(str1)
    douto(str1)
    doutp(str1)
    
    dout_bool(YES)
    dout_bool(NO)
    dout_bool(true)
    dout_bool(false)
    
    dout_int(a)
    dout_hex(0)
    dout_hex(0x1234)
    dout_hex(a)
    
    dout_float(a)
    dout_point(CGPointMake(12, 34))
    dout_size(CGSizeMake(56, 78))
    dout_rect(CGRectMake(1, 2, 3, 4))
    
    doutwork()
    douttrace()
    doutline()
    
    dout_int(@"Info")
    dout_warning(@"W %@", str1)
    dout_error(@"E %d", a)
}

#define __dout(LV, ...)\
    DoutLog(__VA_ARGS__)

#define DoutLogString(string) string

- (void)testOutputVerify {
    STAssertEqualObjects(dout_int(999), @"999 = 999", @"Output verify");
    STAssertEqualObjects(dout_rect(CGRectMake(1, 2, 3, 4)), @"CGRectMake(1, 2, 3, 4) = {{1, 2}, {3, 4}}", @"Output verify");
}


@end
