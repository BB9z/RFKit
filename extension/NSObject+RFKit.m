#import "NSObject+RFKit.h"

@implementation NSObject (RFKit)

+ (void)defaultFill:(id)test with:(id)value {
	if (test == nil || test == [NSNull null]) {
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


#pragma mark BlocksKit
#import <objc/runtime.h>

#define BKTimeDelay(t) dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * t)

@implementation NSObject (BlocksKit)


- (id)performBlock:(void (^)(id sender))block afterDelay:(NSTimeInterval)delay {
	NSParameterAssert(block != nil);
	
	__block BOOL cancelled = NO;
	
	void(^wrapper)(BOOL) = ^(BOOL cancel) {
		if (cancel) {
			cancelled = YES;
			return;
		}
		if (!cancelled) block(self);
	};
	
	dispatch_after(BKTimeDelay(delay), dispatch_get_main_queue(), ^{
		wrapper(NO);
	});
	
	#if !__has_feature(objc_arc)
		return [[wrapper copy] autorelease];
	#else
		return [wrapper copy];
	#endif
}

+ (id)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
	NSParameterAssert(block != nil);
	
	__block BOOL cancelled = NO;
	
	void(^wrapper)(BOOL) = ^(BOOL cancel) {
		if (cancel) {
			cancelled = YES;
			return;
		}
		if (!cancelled) block();
	};
	
	dispatch_after(BKTimeDelay(delay), dispatch_get_main_queue(), ^{ wrapper(NO); });
	
	#if !__has_feature(objc_arc)
		return [[wrapper copy] autorelease];
	#else
		return [wrapper copy];
	#endif
}

+ (void)cancelBlock:(id)block {
	NSParameterAssert(block != nil);
	void(^wrapper)(BOOL) = block;
	wrapper(YES);
}

@end
