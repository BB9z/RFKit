//
//  NSArray+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 13/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+RFKit.h"

@interface RTArray : XCTestCase

@end

@implementation RTArray

- (void)testSafeOperations {
    NSArray *a = @[];
    [a rf_objectAtIndex:9];
    
    NSMutableArray *ma = a.mutableCopy;
    [ma rf_addObject:nil];
    [ma rf_insertObject:nil atIndex:0];
    [ma rf_insertObject:@1 atIndex:99];
    XCTAssert(ma.count == 0, @"Invaild input should have no effect");
}

- (void)testSubarrayRange {
    NSArray *a = @[ @1, @2, @3, @4, @5 ];
#define TestRang(LOCATION, LENGTH, EXCEPTARRAY)\
    XCTAssertEqualObjects([a rf_subarrayWithRangeLocation: LOCATION length: LENGTH], EXCEPTARRAY, @"")

    TestRang( 1,  2, (@[ @2, @3 ]));
    TestRang( 1, 99, (@[ @2, @3, @4, @5 ]));
    TestRang( 1,  0, (@[ ]));
    TestRang( 2,  2, (@[ @3, @4 ]));
    TestRang( 1, -1, (@[ @2 ]));
    TestRang( 1, -5, (@[ @1, @2 ]));
    TestRang(99,  2, (@[ ]));
    TestRang(-1, -2, (@[ @4, @5 ]));
    TestRang(-1,-99, (@[ @1, @2, @3, @4, @5 ]));
    TestRang(-4,  2, (@[ @2, @3 ]));
    TestRang(-6,  2, (@[ @1 ]));
    
    a = @[];
    TestRang(0, 1, @[]);
    TestRang(-1, 2, @[]);
    
    a = @[ @1 ];
    TestRang(0, 1, @[ @1 ]);
    TestRang(1, 0, @[ ]);
}

- (void)testSetLaseObject {
    NSMutableArray *a = @[].mutableCopy;
    
    [a setLastObject:nil];
    XCTAssertEqualObjects(a, @[], @"Add nil object should do nothing");
    
    [a setLastObject:@1];
    XCTAssertEqualObjects(a, @[ @1 ], @"With an empty array is equivalent to adding");
    
    [a setLastObject:@2];
    XCTAssertEqualObjects(a, @[ @2 ], @"With a non-empty array is equivalent to replacing");
}

- (void)testAddObjectsFromDictionary {
    NSMutableArray *a = @[].mutableCopy;
    NSDictionary *d = @{ @"a": @1, @"b": @2 };
    
    [a addObjectsFromDictionary:d withSpecifiedKeys:nil];
    XCTAssertEqual(a.count, 0, @"Empty add");
    
    [a addObjectsFromDictionary:d withSpecifiedKeys:@"a", nil];
    XCTAssertEqual(a.count, 1, @"[ a ]");

    [a removeAllObjects];
    [a addObjectsFromDictionary:d withSpecifiedKeys:@"c", nil];
    XCTAssertEqual(a.count, 0, @"Add not exsist key should do nothing.");
    
    [a removeAllObjects];
    [a addObjectsFromDictionary:d withSpecifiedKeys:@"a", @"b", nil];
    XCTAssertEqual(a.count, 2, @"[ a, b ]");
}

@end
