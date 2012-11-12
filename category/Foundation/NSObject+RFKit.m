
#import "RFKit.h"
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

- (NSArray *)objectsForIndexArray:(NSArray *)indexsArray {
    int indexCount = [indexsArray count];
    id ctObjectSet = self;
    
    for (int i=0; i<indexCount; i++) {
        id ctIndex = [indexsArray objectAtIndex:i];
        _douto(ctObjectSet)
        _douto(ctIndex)
        
        if ([ctIndex isKindOfClass:[NSNumber class]]) {
            if ([ctObjectSet respondsToSelector:@selector(objectAtIndex:)]) {
                NSNumber *indexObj = ctIndex;
                ctObjectSet = [ctObjectSet objectAtIndex:[indexObj intValue]];
            }
            else {
                @throw [NSException exceptionWithName:@"RFKit: Bad selector" reason:[NSString stringWithFormat:@"%@ can`t responds objectAtIndex: for index %@.", ctObjectSet, ctIndex] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:self, @"set", indexsArray, @"indexsArray", nil]];
            }
        }
        else {
            if ([ctObjectSet respondsToSelector:@selector(objectForKey:)]) {
                NSString *indexObj = ctIndex;
                ctObjectSet = [((NSDictionary *)ctObjectSet) objectForKey:indexObj];
            }
            else {
                @throw [NSException exceptionWithName:@"RFKit: Bad selector" reason:[NSString stringWithFormat:@"%@ can`t responds objectForKey: for index %@.", ctObjectSet, ctIndex] userInfo:[NSDictionary dictionaryWithObjectsAndKeys:self, @"set", indexsArray, @"indexsArray", nil]];
            }
        }
    }

    if (![ctObjectSet isKindOfClass:[NSArray class]]) {
        ctObjectSet = [NSArray arrayWithObject:ctObjectSet];
    }
    return ctObjectSet;
}

- (NSArray *)objectsForDictKeyArray:(NSArray *)keyArray {
    _douto(self)
    _douto([keyArray firstObject])
    // 空数组，第一个元素非NSString
    if (keyArray.count == 0 ||
        ![[keyArray firstObject] isKindOfClass:[NSString class]]) {
        _douts(@"空数组，第一个元素非NSString")
        return nil;
    }
    
    // 既不是数组也不是字典
    if (![self respondsToSelector:@selector(objectForKey:)] && ![self respondsToSelector:@selector(objectAtIndex:)]) {
        _douts(@"既不是数组也不是字典")
        return nil;
    }
    
    // 字典，只有一个key
    if (keyArray.count == 1 && [self respondsToSelector:@selector(objectForKey:)]) {
        _douts(@"字典，只有一个key")
        id tmp = [((NSDictionary *)self) objectForKey:[keyArray firstObject]];
        _douto(tmp)
        if (tmp) {
             return [NSArray arrayWithObject:tmp];
        }
        else {
            return nil;
        }
        
    }
    
    // keyArray.count >=1，参数无误
    // 字典或数组
    NSMutableArray *arrayFirstRemoved = [NSMutableArray arrayWithArray:keyArray];
    [arrayFirstRemoved removeObjectAtIndex:0];
    
    // Array
    if ([self isKindOfClass:[NSArray class]]) {
        _douts(@"array")
        NSMutableArray *r = [NSMutableArray arrayWithCapacity:20];
        
        for (id obj in (NSArray *)self) {
            id tmp = [obj objectsForDictKeyArray:keyArray];
            [r addObjectsFromArray:tmp];
        }
        _douto(r)
        return r;
    }
    else {
        _douts(@"dict")
        // Dict
        id ctObjectSet = [((NSDictionary *)self) objectForKey:[keyArray firstObject]];
        return [ctObjectSet objectsForDictKeyArray:arrayFirstRemoved];
    }
}

- (id)performRespondedSelector:(SEL)aSelector {
    if ([self respondsToSelector:aSelector]) {
        // via http://stackoverflow.com/a/7933931/945906
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [self performSelector:aSelector];
        #pragma clang diagnostic pop
    }
    else {
        return nil;
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

+ (void)performBlock:(void (^)(id))block afterDelay:(NSTimeInterval)delay on:(id)firstObject,... {
	va_list ap;
	va_start(ap, firstObject);
	for (id obj = firstObject; obj != nil; obj = va_arg(ap, id)) {
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * delay), dispatch_get_main_queue(), ^{
			block(obj);
		});
	}
	va_end(ap);
}

@end
