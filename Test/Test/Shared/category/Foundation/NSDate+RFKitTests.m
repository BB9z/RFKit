//
//  NSDateTests.m
//  RFKit
//
//  Created by BB9z on 13-8-30.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+RFKit.h"
#import "dout.h"

@interface RTNSDate : XCTestCase
@end

@implementation RTNSDate

- (void)testMakeDate {
    NSDate *d;
    d = [NSDate dateWithYear:-1000 month:0 day:0 hour:0 minute:0 second:0];
    XCTAssertNotNil(d, @"");
    
    d = [NSDate dateWithYear:2000 month:2 day:34 hour:0 minute:0 second:0];
    XCTAssertNotNil(d, @"");
    
    d = [NSDate dateWithYear:2000 month:2 day:30 hour:-24 minute:0 second:0];
    XCTAssertNotNil(d, @"");
    
    d = [NSDate dateWithYear:9999999999 month:0 day:0 hour:0 minute:0 second:0];
    XCTAssertNotNil(d, @"");
    
    d = [NSDate dateWithYear:-9999999999 month:0 day:0 hour:0 minute:0 second:0];
    XCTAssertNotNil(d, @"");
}

- (void)testDaysBetween {
    NSDate *d1 = [NSDate dateWithYear:0 month:0 day:0 hour:0 minute:0 second:0];
    NSDate *d2 = [NSDate dateWithYear:0 month:0 day:1 hour:0 minute:0 second:0];
    XCTAssertEqual([NSDate daysBetweenDate:d1 andDate:d2], 1, @"");
}

- (void)testSameDay {
    NSDate *d1 = [NSDate dateWithYear:0 month:0 day:0 hour:24 minute:0 second:0];
    NSDate *d2 = [NSDate dateWithYear:0 month:0 day:1 hour:0 minute:0 second:0];
    XCTAssertTrue([d1 isSameDayWithDate:d2], @"");
    
    NSDate *d3 = [NSDate dateWithYear:0 month:0 day:2 hour:0 minute:0 second:0];
    XCTAssertFalse([d2 isSameDayWithDate:d3], @"");
}

- (void)testNilParameters {
    NSDate *now = [NSDate date];
    
    XCTAssertFalse([now isSameDayWithDate:nil], @"nil input should return false");
    XCTAssertThrows([NSDate daysBetweenDate:nil andDate:nil], @"Parameter cannot be nil");
    XCTAssertThrows([NSDate daysBetweenDate:now andDate:nil], @"Parameter cannot be nil");
    XCTAssertThrows([NSDate daysBetweenDate:nil andDate:now], @"Parameter cannot be nil");
    XCTAssertEqual([NSDate daysBetweenDate:now andDate:now], 0, @"Same day should return 0");
}

@end
