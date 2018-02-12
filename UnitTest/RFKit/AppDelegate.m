//
//  AppDelegate.m
//  RFKit
//
//  Created by BB9z on 13-6-16.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *vc = [[UIViewController alloc] init];
    UILabel *lb = [[UILabel alloc] init];
    lb.text = @"This project is only for Unit Test.";
    lb.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [lb sizeToFit];
    [vc.view addSubview:lb];
    lb.center = vc.view.center;
    
    self.window.rootViewController = vc;
    return YES;
}

@end
