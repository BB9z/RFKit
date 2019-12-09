//
//  UIResponder+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 2019/2/13.
//  Copyright © 2019 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIResponder+RFKit.h"

@interface RTResponder : XCTestCase

@end

@implementation RTResponder


- (void)testViewController {
#if TARGET_OS_OSX
    // Cannot create an NSViewController without nib.
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"macos" bundle:bundle];
    NSViewController *vc = [sb instantiateControllerWithIdentifier:@"avc"];
#else
    UIViewController *vc = UIViewController.new;
#endif
    UIView *chidrenView = UIView.new;
    [vc.view addSubview:chidrenView];
    XCTAssertEqual(vc.view.viewController, vc, @"View's viewController should be vc");
    XCTAssertEqual(chidrenView.viewController, vc, @"ChidrenView's viewController should be vc");
}

@end
