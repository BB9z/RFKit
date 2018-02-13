//
//  RTNSObject.m
//  Test-iOS
//
//  Created by BB9z on 13/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+RFKit.h"

@interface RTNSObject : XCTestCase
@end

@implementation RTNSObject

- (void)testDefaults {
    id defaultValue = @"NoNil";
    id test = nil;
    test = [@[] get:test defaults:defaultValue];
    XCTAssertEqualObjects(test, defaultValue, @"nil default");
    
    test = NSNull.null;
    test = [test get:test defaults:defaultValue];
    XCTAssertEqualObjects(test, defaultValue, @"NSNull default");
}

@end
