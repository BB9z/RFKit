//
//  NSJSONSerialization+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 22/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RFKit/NSJSONSerialization+RFKit.h>
#import "dout.h"

@interface RTNSJSONSerialization : XCTestCase

@end

@implementation RTNSJSONSerialization

- (void)testJSONPDecode {
    NSString *input;
    id json = nil;
    NSError __autoreleasing *e = nil;
    
    input = nil;
    json = [NSJSONSerialization JSONObjectWithJSONPString:input error:&e];
    XCTAssertNil(json, @"");
    XCTAssertNotNil(e, @"Should be invaild error");
    
    input = @"test()";
    json = [NSJSONSerialization JSONObjectWithJSONPString:input error:&e];
    XCTAssertNil(json, @"");
    XCTAssertNotNil(e, @"Should be invaild error");
    
    e = nil;
    input = @"te2(1)";
    json = [NSJSONSerialization JSONObjectWithJSONPString:input error:&e];
    XCTAssertEqualObjects(json, @1, @"");
    XCTAssertNil(e, @"Shold has no error");
    
    e = nil;
    input = @"te_s(true)";
    json = [NSJSONSerialization JSONObjectWithJSONPString:input error:&e];
    XCTAssertEqualObjects(json, @YES, @"");
    XCTAssertNil(e, @"Shold has no error");
    
    e = nil;
    input = @"test4({\"Name\": \"Foo\", \"Id\": 1234})";
    json = [NSJSONSerialization JSONObjectWithJSONPString:input error:&e];
    XCTAssertEqualObjects(json, (@{ @"Name": @"Foo", @"Id": @1234 }), @"");
    XCTAssertNil(e, @"Shold has no error");
}

@end
