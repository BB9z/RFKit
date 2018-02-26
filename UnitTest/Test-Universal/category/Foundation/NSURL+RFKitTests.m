//
//  NSURL+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 22/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+RFKit.h"
#import "dout.h"

@interface RTNSURL : XCTestCase

@end

@implementation RTNSURL

- (void)testQueryDictionary {
    NSString *q = @"?v=%E4%B8%AD%E6%96%87&v2&v3=&v%204=123&v5=a+b";
    NSDictionary *d = [NSURL URLWithString:q].queryDictionary;
    XCTAssertEqualObjects(d, (@{ @"v": @"中文", @"v3": @"", @"v 4": @"123", @"v5": @"a b" }), @"");
}

@end
