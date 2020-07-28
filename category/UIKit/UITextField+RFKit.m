
#import "UITextField+RFKit.h"

@implementation UITextField (RFKit)

- (nullable NSString *)rf_trimedText {
    return [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//! REF: http://stackoverflow.com/a/11354330/945906
- (NSRange)rf_selectedRange {
    UITextRange *selectedTextRange = self.selectedTextRange;
    NSUInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedTextRange.start];
    NSUInteger length = [self offsetFromPosition:selectedTextRange.start toPosition:selectedTextRange.end];
    return NSMakeRange(location, length);
}

@end
