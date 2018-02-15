//
//  NSDateFormater+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 15/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDateFormatter+RFKit.h"
#import "dout.h"

@interface RTNSDateFormater : XCTestCase
@end

@implementation RTNSDateFormater

- (void)testNilParameter {
    NSDateFormatter *f = [NSDateFormatter currentLocaleFormatterFromTemplate:nil];
    douto(f)
    douto(f.dateFormat)
    
    f = [NSDateFormatter currentLocaleFormatterFromTemplate:@"invaild"];
    douto(f)
    douto(f.dateFormat)
    
    f = [NSDateFormatter dateFormatterWithDateFormat:nil timeZoneWithName:nil];
    douto(f)
    douto(f.timeZone)
    XCTAssertEqualObjects(f.timeZone, NSTimeZone.systemTimeZone, @"Timezone should be the default");
    douto(f.dateFormat)
    
    f = [NSDateFormatter dateFormatterWithDateFormat:nil timeZoneWithName:@"OMG"];
    douto(f)
    douto(f.timeZone)
    XCTAssertEqualObjects(f.timeZone, NSTimeZone.systemTimeZone, @"Timezone should be the default");
    douto(f.dateFormat)
}

@end
