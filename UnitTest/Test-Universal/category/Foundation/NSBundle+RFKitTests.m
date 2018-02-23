//
//  NSBundle+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 23/02/2018.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSBundle+RFKit.h"
#import "dout.h"

@interface RTNSBundle : XCTestCase

@end

@implementation RTNSBundle

- (void)testZZ {
    douto(NSBundle.mainBundlePathForTemp)
    douto(NSBundle.mainBundlePathForPreferences)
    douto(NSBundle.mainBundlePathForDocuments)
    douto(NSBundle.mainBundlePathForTemp)
    douto(NSBundle.mainBundle.bundlePath)
    douto(NSBundle.mainBundle.executablePath)
    douto(NSBundle.mainBundle.sharedSupportPath)
    douto(NSBundle.mainBundle.resourcePath)
}

@end
