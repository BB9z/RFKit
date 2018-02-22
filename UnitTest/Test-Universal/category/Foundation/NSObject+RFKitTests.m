//
//  RTNSObject.m
//  Test-iOS
//
//  Created by BB9z on 13/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+RFKit.h"
#import "dout.h"

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

- (void)testPerformSelector {
    NSMutableArray *a = @[ @1, @2, @3 ].mutableCopy;
    
    SEL sel = NULL;
    id ret = [a performRespondedSelector:sel];
    XCTAssertNil(ret, @"Input nil, return nil");
    
    sel = @selector(notExsisted);
    ret = [a performRespondedSelector:sel];
    XCTAssertNil(ret, @"Return nil if not responds");
    
    sel = @selector(sortUsingComparator:);
    XCTAssertThrows([a performRespondedSelector:sel], @"Unsupport selector should throw");
    
    sel = @selector(description);
    ret = [a performRespondedSelector:sel];
    _douto(ret)
    XCTAssert([(NSString *)ret length] > 2, @"");
    
    sel = @selector(count);
    ret = [a performRespondedSelector:sel];
    _douto(ret)
    XCTAssertEqualObjects(ret, @(a.count), @"");
    
    sel = @selector(removeAllObjects);
    ret = [a performRespondedSelector:sel];
    XCTAssertNil(ret, @"method return void");
    XCTAssertEqualObjects(a, @[], @"a should be empty after remove all objects");
    
    NSNumber *num = @(123.45);
#define AssertEqualNumberType(METHOD)\
XCTAssertEqualObjects([num performRespondedSelector:@selector(METHOD)], @(num.METHOD), @"");

    AssertEqualNumberType(integerValue)
    AssertEqualNumberType(boolValue)
    XCTAssert([num performRespondedSelector:@selector(class)] == num.class, @"Test Class");
    
    NSSortDescriptor *cp = [NSSortDescriptor sortDescriptorWithKey:@"key" ascending:YES selector:@selector(compare:)];
    XCTAssert(cp.selector != NULL, @"selector should exsist");
    ret = [cp performRespondedSelector:@selector(selector)];
    XCTAssertEqualObjects(ret, @"compare:", @"");
}

@end
