//
//  UIPickerView+RFKitTests.m
//  RFKit
//
//  Created by BB9z on 2018/5/22.
//  Copyright © 2018 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIPickerView+RFKit.h"

@interface RTUIPickerView : XCTestCase <
    UIPickerViewDataSource
>

@end

@implementation RTUIPickerView

- (void)testSelectRow {
    UIPickerView *p = UIPickerView.alloc.init;
    p.dataSource = self;
    XCTAssertThrows([p selectRow:-1 inComponent:NSNotFound animated:YES]);
    XCTAssertNoThrow([p rf_selectRow:5 inComponent:5 animated:YES]);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

@end
