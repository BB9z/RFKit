//
//  UINavigationController+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 2018/7/16.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UINavigationController+RFKit.h"

@interface RTAViewController : UIViewController
@end
@implementation RTAViewController
@end

@interface RTBViewController : UIViewController
@end
@implementation RTBViewController
@end

@interface RTUINavigationController : XCTestCase

@end

@implementation RTUINavigationController

- (void)testPreviousVC {
    UIViewController *a = RTAViewController.new;
    UIViewController *b = RTBViewController.new;
    UIViewController *c = UIViewController.new;

    UINavigationController *nav = UINavigationController.new;
    XCTAssertEqualObjects(nav.previousViewController, nil);
    
    [nav setViewControllers:@[ a ]];
    XCTAssertEqualObjects(nav.previousViewController, nil);
    XCTAssertTrue([nav hasViewControllerWithClass:RTAViewController.class beforeViewController:nil]);
    XCTAssertFalse([nav hasViewControllerWithClass:RTBViewController.class beforeViewController:nil]);

    [nav setViewControllers:@[ a, b ]];
    XCTAssertEqualObjects(nav.previousViewController, a);
    XCTAssertEqualObjects([nav previousViewControllerForViewController:a], nil);
    XCTAssertEqualObjects([nav previousViewControllerForViewController:b], a);
    XCTAssertEqualObjects([nav previousViewControllerClassForViewController:b], RTAViewController.class);
    XCTAssertTrue([nav hasViewControllerWithClass:RTAViewController.class beforeViewController:b]);
    XCTAssertTrue([nav hasViewControllerWithClass:RTAViewController.class beforeViewController:nil]);
    XCTAssertTrue([nav hasViewControllerWithClass:RTBViewController.class beforeViewController:nil]);
    XCTAssertEqualObjects([nav viewControllerWithClass:RTAViewController.class beforeViewController:c], nil);

    [nav presentViewController:c animated:NO completion:nil];
    XCTAssertEqualObjects(nav.previousViewController, a);
    XCTAssertEqualObjects([nav previousViewControllerForViewController:c], nil);
}

- (void)testRemoveVC {
    UIViewController *a = RTAViewController.new;
    UIViewController *b = RTBViewController.new;
    UIViewController *c = UIViewController.new;
    
    UINavigationController *nav = UINavigationController.new;
    [nav removeViewController:nil animated:NO];
    XCTAssertEqualObjects(nav.viewControllers, @[]);
    
    [nav setViewControllers:@[ a, b, c ]];
    [nav removeViewController:c animated:NO];
    XCTAssertEqualObjects(nav.viewControllers, (@[ a, b ]));
    [nav removeViewController:a animated:NO];
    XCTAssertEqualObjects(nav.viewControllers, @[ b ]);
}

- (void)testSetTopVC {
    UIViewController *a = RTAViewController.new;
    UIViewController *b = RTBViewController.new;
    UINavigationController *nav = UINavigationController.new;
    [nav setTopViewController:a animated:NO];
    XCTAssertEqualObjects(nav.viewControllers, @[ a ]);
    [nav setTopViewController:b animated:NO];
    XCTAssertEqualObjects(nav.viewControllers, @[ b ]);
}

@end


