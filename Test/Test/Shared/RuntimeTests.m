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
@property (nonatomic) RuntimeTests *selfRefrence;
@end

@implementation RuntimeTests
@dynamic selfRefrence;

- (void)testKeypathClassInstance {
    NSString *__nonnull kp0 = @keypath(RuntimeTests.new, selfRefrence);
    XCTAssertEqualObjects(kp0, @"selfRefrence");

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
