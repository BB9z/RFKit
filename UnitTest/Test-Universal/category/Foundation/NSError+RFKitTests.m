//
//  NSError+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 21/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSError+RFKit.h"
#import "dout.h"

@interface RTNSError : XCTestCase

@end

@implementation RTNSError

- (void)testDomain {
    NSError *e = [NSError errorWithDomain:nil code:0 localizedDescription:nil];
    XCTAssertNotNil(e.domain, @"Domain is filled by default");
}

@end
