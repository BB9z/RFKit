//
//  NSObject+RFKitTests.m
//  RFKit
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

- (void)testObjectsForIndexArray {
    NSArray *a = @[
        NSNull.null,
        @{
            @"a": @{
                @"1": @"got"
            },
            @"b": NSNull.null
        }
    ];
    
    XCTAssertEqualObjects(([a objectsForIndexArray:@[ @1, @"a", @"1" ]]), (@[ @"got" ]), @"");
    
    NSDictionary *d = @{
        @"a": @[ @1 ],
        @"b": @[ @2 ]
    };
    XCTAssertEqualObjects(([d objectsForIndexArray:@[ @"a" ]]), (@[ @1 ]), @"");
    
    NSString *c = @"foo";
    XCTAssertEqualObjects(([c objectsForIndexArray:@[ ]]), (@[ c ]), @"");
    XCTAssertThrows(([c objectsForIndexArray:@[ @"a" ]]), @"");
}

- (void)testObjectsForDictKeyArray {
    NSArray *a = @[
        NSNull.null,
        @{
            @"a": @1
        },
        @{
            @"a": @2
        },
        @{
            @"b": @"some"
        },
        @[
            @{
                @"a": @3
            }
        ]
    ];
    XCTAssertEqualObjects(([a objectsForDictKeyArray:@[ @"a" ]]), (@[ @1, @2, @3 ]), @"");
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
