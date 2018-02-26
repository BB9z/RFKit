//
//  NSString+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 22/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+RFKit.h"

@interface RTNSString : XCTestCase

@end

@implementation RTNSString

- (void)testMD5String {
    XCTAssertEqualObjects(@"string".rf_MD5String, @"b45cffe084dd3d20d928bee85e7b0f21", @"");
    XCTAssertEqualObjects([NSString MD5String:@"string"], @"B45CFFE084DD3D20D928BEE85E7B0F21", @"");
}

- (void)testPinyinString {
    XCTAssertEqualObjects([@"中文，ABC, ö" rf_pinyinStringWithStripDiacritics:NO], @"zhōng wén， ABC, ö", @"");
    XCTAssertEqualObjects([@"中文，ABC, ö" rf_pinyinStringWithStripDiacritics:YES], @"zhong wen， ABC, o", @"");
    XCTAssertEqualObjects([NSString pinyinFromString:@"中文"], @"zhong wen", @"");
}

- (void)testContainsString {
    NSString *s1 = @"FööBar2000";
    
    XCTAssertTrue([s1 containsString:@"2000"], @"");
    XCTAssertFalse([s1 containsString:@"2001"], @"");

    XCTAssertTrue([s1 containsString:@"fööbar" options:NSCaseInsensitiveSearch], @"");
    XCTAssertTrue([s1 containsString:@"oo" options:NSDiacriticInsensitiveSearch], @"");
}

- (void)testStringByTrimmingToLength {
    XCTAssertEqualObjects([@"abcde" stringByTrimmingToLength:9 withTruncationToken:@"..."], @"abcde", @"");
    XCTAssertEqualObjects([@"abcde" stringByTrimmingToLength:5 withTruncationToken:@"..."], @"abcde", @"");
    XCTAssertEqualObjects([@"abcde" stringByTrimmingToLength:3 withTruncationToken:@"..."], @"...", @"");
    XCTAssertEqualObjects([@"abcde" stringByTrimmingToLength:1 withTruncationToken:nil], @"a", @"");
    XCTAssertThrows([@"abcde" stringByTrimmingToLength:2 withTruncationToken:@"..."], @"");
}

- (void)testReverseString {
    XCTAssertEqualObjects(@"abc".reverseString, @"cba", @"");
    XCTAssertEqualObjects(@"s".reverseString, @"s", @"");
}

- (void)testExtractedHTMLContent {
    NSString *html = @"<tag><!-- comment -->some</tag>";
    XCTAssertEqualObjects(html.extractedHTMLContent, @"some", @"");
}

@end
