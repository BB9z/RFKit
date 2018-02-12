//
//  NSDateTests.m
//  RFKit
//
//  Created by BB9z on 13-8-30.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "NSDateTests.h"
#import "NSDate+RFKit.h"

@implementation NSDateTests

- (void)testNilParameters {
    NSDate *now = [NSDate date];
    
    XCTAssertFalse([now isSameDayWithDate:nil]);
    XCTAssertEqual([NSDate daysBetweenDate:nil andDate:nil], 0);
    XCTAssertThrows([NSDate daysBetweenDate:now andDate:nil]);
    XCTAssertThrows([NSDate daysBetweenDate:nil andDate:now]);
    XCTAssertEqual([NSDate daysBetweenDate:now andDate:now], 0);
}

@end
