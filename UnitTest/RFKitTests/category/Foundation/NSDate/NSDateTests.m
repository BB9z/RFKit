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
    
    STAssertFalse([now isSameDayWithDate:nil], nil);
    STAssertEquals([NSDate daysBetweenDate:nil andDate:nil], 0, nil);
    STAssertThrows([NSDate daysBetweenDate:now andDate:nil], nil);
    STAssertThrows([NSDate daysBetweenDate:nil andDate:now], nil);
    STAssertEquals([NSDate daysBetweenDate:now andDate:now], 0, nil);
}

@end
