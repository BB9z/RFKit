/*!
 UITextField extension
 RFKit

 Copyright (c) 2020 BB9z
 https://github.com/BB9z/RFKit

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UITextField (RFKit)

/**
 The text string removes whitespaces and newlines from both ends.
 */
- (nullable NSString *)rf_trimedText;

/**
 The current selection range of the receiver.
 */
- (NSRange)rf_selectedRange;

@end
