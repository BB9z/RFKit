
#import "NSArray+RFKit.h"

@implementation NSArray (RFKit)

- (id)firstObject {
    return (self!=nil && self.count>0) ? [self objectAtIndex:0] : nil;
}

@end
