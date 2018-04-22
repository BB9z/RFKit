//
//  RFGeometryTests.m
//  RFKit
//
//  Created by BB9z on 2018/4/22.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RFGeometry.h"

@interface RFGeometryTests : XCTestCase

@end

@implementation RFGeometryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEdgeInsets {
    UIEdgeInsets a = UIEdgeInsetsMakeWithSameMargin(5);
    UIEdgeInsets b = UIEdgeInsetsMake(5, 5, 5, 5);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(a, b));
    UIEdgeInsets inset = UIEdgeInsetsMake(1, 2, 3, 4);
    a = UIEdgeInsetsReverse(inset);
    b = UIEdgeInsetsMake(-1, -2, -3, -4);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(a, b));
}

@end
