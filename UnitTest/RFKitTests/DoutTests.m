//
//  DoutTests.m
//  RFKit
//
//  Created by BB9z on 13-6-16.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "DoutTests.h"
#import "dout.h"
#import "RFKit.h"

#define kPerformanceLoopTime 1000
#define RFDebugLevel RFDebugLevelVerbose

@implementation DoutTests

- (void)testPerformance {
    // Skip this test
    return;
    
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
    doutlastmethod()
    doutline()

    dout_debug(@"Debug")
    dout_info(@"Info")
    dout_warning(@"W %@", str1)
    dout_error(@"E %d", a)
    
    _dout(@"%@, %d", str1, a)
    _douts(str1)
    _douto(str1)
    _doutp(str1)
    
    _dout_bool(YES)
    _dout_bool(NO)
    _dout_bool(true)
    _dout_bool(false)
    
    _dout_int(a)
    _dout_hex(0)
    _dout_hex(0x1234)
    _dout_hex(a)
    
    _dout_float(a)
    _dout_point(CGPointMake(12, 34))
    _dout_size(CGSizeMake(56, 78))
    _dout_rect(CGRectMake(1, 2, 3, 4))
    
    _doutwork()
    _douttrace()
    _doutlastmethod()
    _doutline()

    _dout_debug(@"Debug")
    _dout_info(@"Info")
    _dout_warning(@"W %@", str1)
    _dout_error(@"E %d", a)
}

#define __dout(LV, ...)\
    DoutLog(__VA_ARGS__)

#define DoutLogString(string) string

- (void)testOutputVerify {
    STAssertEqualObjects(dout_int(999), @"999 = 999", @"Output verify");
    STAssertEqualObjects(dout_rect(CGRectMake(1, 2, 3, 4)), @"CGRectMake(1, 2, 3, 4) = {{1, 2}, {3, 4}}", @"Output verify");
}


@end
