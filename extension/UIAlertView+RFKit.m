//
//  UIAlertView+RFKit.m
//  meiluohua
//
//  Created by BB9z on 12-6-13.
//  Copyright (c) 2012年 Chinamobo. All rights reserved.
//

#import "UIAlertView+RFKit.h"

@implementation UIAlertView (RFKit)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message  buttonTitle:(NSString *)buttonTitle {
    if (buttonTitle == nil) {
        buttonTitle = @"OK";
    }
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonTitle otherButtonTitles:nil] show];
}

@end
