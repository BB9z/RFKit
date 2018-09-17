//
//  RuntimeTests.m
//  RFKit
//
//  Created by BB9z on 2018/9/17.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RFKit/RFRuntime.h>

@interface RuntimeTests : XCTestCase
@property RuntimeTests *selfRefrence;
@end

@implementation RuntimeTests

- (void)testKeypathClassInstance {
    NSString *__nonnull kp = @keypathClassInstance(RuntimeTests, selfRefrence);
    XCTAssertEqualObjects(kp, @"selfRefrence");
    NSString *__nonnull kp2 = @keypathClassInstance(RuntimeTests, selfRefrence, selfRefrence.selfRefrence);
    XCTAssertEqualObjects(kp2, @"selfRefrence.selfRefrence");
}

- (void)testDefineConstString {
    RFDefineConstString(aaa);
    RFDefineConstString(bbb, "something");
    
    XCTAssertEqualObjects(aaa, @"aaa");
    XCTAssertEqualObjects(bbb, @"something");
}



@end
