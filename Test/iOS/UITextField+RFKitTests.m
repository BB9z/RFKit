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
    XCTAssert(tf.rf_trimedText.length == 0);
    tf.text = @"foo";
    XCTAssertEqualObjects(tf.rf_trimedText, @"foo");
    tf.text = @" foo bar\n ";
    XCTAssertEqualObjects(tf.rf_trimedText, @"foo bar");
}

@end
