//
//  NSDictionary+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 21/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+RFKit.h"

@interface RTNSDictionary : XCTestCase

@end

@implementation RTNSDictionary

- (void)testSafeOperations {
    NSMutableDictionary *d = @{}.mutableCopy;
    [d rf_setObject:nil forKey:nil];
    [d rf_setObject:@"foo" forKey:nil];
    [d rf_setObject:nil forKey:@"bar"];
    XCTAssert(d.count == 0, @"nil input should have no effect");

    d[@"k"] = @"v";
    XCTAssertEqualObjects(d[@"k"], @"v", @"");
    [d rf_removeObjectForKey:@"k"];
    XCTAssertEqualObjects(d[@"k"], nil, @"k should be removed");
    XCTAssertNoThrow([d rf_removeObjectForKey:@"k"], @"Double remove should works");
}

- (void)testAddEntriesFromDictionary {
    NSMutableDictionary *d = @{}.mutableCopy;
    NSDictionary *fromDic = @{ @"a": @1, @"b": @2, @"c": @3 };
    XCTAssertEqual([d addEntriesFromDictionary:fromDic withSpecifiedKeys:nil], 0, @"No key, no effect");
    XCTAssertEqualObjects(d, @{}, @"");
    XCTAssertEqual(([d addEntriesFromDictionary:fromDic withSpecifiedKeys:@"d", nil]), 0, @"Not exsist, no effect");
    XCTAssertEqualObjects(d, @{}, @"");

    XCTAssertEqual(([d addEntriesFromDictionary:fromDic withSpecifiedKeys:@"a", @"b", nil]), 2, @"Add two key");
    XCTAssertEqualObjects(d, (@{ @"a": @1, @"b": @2 }), @"");

    [d removeAllObjects];
    XCTAssertEqual(([d addEntriesFromDictionary:fromDic withSpecifiedKeys:@"c", @"c", nil]), 1, @"Add the same key");
    XCTAssertEqualObjects(d, (@{ @"c": @3 }), @"");
}

@end
