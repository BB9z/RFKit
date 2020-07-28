//
//  UITextField+RFKitTests
//  RFKit
//

#import <XCTest/XCTest.h>
#import "RTHelper.h"
#import "UITextField+RFKit.h"


@interface RTUITextField : XCTestCase

@end

@implementation RTUITextField

- (void)testTrimedText {
    UITextField *tf = UITextField.new;
    tf.text = nil;
    XCTAssertEqualObjects(tf.rf_trimedText, nil);
    tf.text = @"";
    XCTAssertEqualObjects(tf.rf_trimedText, @"");
    tf.text = @"foo";
    XCTAssertEqualObjects(tf.rf_trimedText, @"foo");
    tf.text = @" bar/n";
    XCTAssertEqualObjects(tf.rf_trimedText, @"bar");
}

@end
