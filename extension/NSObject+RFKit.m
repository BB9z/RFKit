#import "NSObject+RFKit.h"

@implementation NSObject (RFKit)

- (void)defaultFill:(id)test with:(id)value {
	if (test == nil || test == [NSNull null]) {
		douts(@"test NULL in defaultFill")
		test = value;
	}
}

- (id)get:(id)test defaults:(id)value {
	if (test == nil || test == [NSNull null]) {
		return value;
	}
	else {
		return test;
	}
}

@end
