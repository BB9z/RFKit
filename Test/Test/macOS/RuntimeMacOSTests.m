//
//  RuntimeMacOSTests.m
//  Test-macOS
//
//  Created by BB9z on 2018/9/17.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <RFKit/RFRuntime.h>

@interface RuntimeMacOSTests : XCTestCase

@end

@implementation RuntimeMacOSTests

- (void)testUITypesBridge {
    UIEdgeInsets inset = UIEdgeInsetsMake(1, 2, 3, 4);
    NSEdgeInsets inset2 = NSEdgeInsetsMake(1, 2, 3, 4);
    if (@available(macOS 10.10, *)) {
        XCTAssert(UIEdgeInsetsEqualToEdgeInsets(inset, inset2));
        
        // Strange, use NSEdgeInsetsZero case build fails. Xcode 10
//        NSEdgeInsets inset4 = NSEdgeInsetsZero;
//        UIEdgeInsets inset3 = UIEdgeInsetsZero;
//        XCTAssertFalse(UIEdgeInsetsEqualToEdgeInsets(inset3, inset2));
    }
    XCTAssert(UIView.class == NSView.class);
    XCTAssert(UIButton.class == NSButton.class);
    XCTAssert(UIImage.class == NSImage.class);
}

@end
