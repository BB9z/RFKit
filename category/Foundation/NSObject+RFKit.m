
#import "RFRuntime.h"
#import "NSObject+RFKit.h"

@implementation NSObject (RFKit)

- (id)get:(id)test defaults:(id)value {
	if (test == nil || test == [NSNull null]) {
		return value;
	}
	else {
		return test;
	}
}

- (nonnull NSArray *)objectsForIndexArray:(nullable NSArray *)indexsArray {
    NSUInteger indexCount = indexsArray.count;
    id ctObjectSet = self;
    
    for (NSUInteger i = 0; i < indexCount; i++) {
        id ctIndex = indexsArray[i];
        if ([ctIndex isKindOfClass:NSNumber.class]) {
            if (![ctObjectSet respondsToSelector:@selector(objectAtIndex:)]) {
                @throw [NSException exceptionWithName:@"RFKit: Bad selector" reason:[NSString stringWithFormat:@"%@ can`t responds objectAtIndex: for index %@.", ctObjectSet, ctIndex] userInfo:@{@"set": self, @"indexsArray": (id)indexsArray}];
            }
            NSNumber *indexObj = ctIndex;
            ctObjectSet = [ctObjectSet objectAtIndex:indexObj.integerValue];
        }
        else {
            if (![ctObjectSet respondsToSelector:@selector(objectForKey:)]) {
                @throw [NSException exceptionWithName:@"RFKit: Bad selector" reason:[NSString stringWithFormat:@"%@ can`t responds objectForKey: for index %@.", ctObjectSet, ctIndex] userInfo:@{@"set": self, @"indexsArray": (id)indexsArray}];
            }
            ctObjectSet = [ctObjectSet objectForKey:ctIndex];
        }
    }

    if (![ctObjectSet isKindOfClass:NSArray.class]) {
        ctObjectSet = @[ctObjectSet];
    }
    return ctObjectSet;
}

- (nullable NSArray *)objectsForDictKeyArray:(nullable NSArray *)keyArray {
    if (keyArray.count == 0
        || ![keyArray.firstObject isKindOfClass:NSString.class]) {
        return nil;
    }
    NSArray *keys = keyArray;
    
    if (![self respondsToSelector:@selector(objectForKey:)]
        && ![self respondsToSelector:@selector(objectAtIndex:)]) {
        return nil;
    }

    id firstIndex = keys.firstObject;

    // 字典，只有一个key
    if (keys.count == 1
        && [self respondsToSelector:@selector(objectForKey:)]) {
        id tmp = [(NSDictionary *)self objectForKey:firstIndex];
        if (tmp) {
             return @[tmp];
        }
        else {
            return nil;
        }
    }
    
    // keyArray.count >=1，参数无误
    // 字典或数组
    NSMutableArray *arrayFirstRemoved = [NSMutableArray arrayWithArray:keys];
    [arrayFirstRemoved removeObjectAtIndex:0];
    
    if ([self isKindOfClass:NSArray.class]) {
        // Array
        NSMutableArray *r = [NSMutableArray arrayWithCapacity:20];
        
        for (id obj in (NSArray *)self) {
            id tmp = [obj objectsForDictKeyArray:keys];
            [r addObjectsFromArray:tmp];
        }
        return r;
    }
    else {
        // Dict
        id ctObjectSet = [(NSDictionary *)self objectForKey:firstIndex];
        return [ctObjectSet objectsForDictKeyArray:arrayFirstRemoved];
    }
}

- (nullable id)performRespondedSelector:(nullable SEL)selector {
    if (!selector || ![self respondsToSelector:selector]) return nil;
    SEL aSelector = selector;
    NSMethodSignature *ms = [self methodSignatureForSelector:aSelector];
    NSAssert(ms, @"Cannot get method signature for %@", NSStringFromSelector(aSelector));
    NSAssert(ms.numberOfArguments == 2, @"The selector must have no arguments.");
    const char *rtype = ms.methodReturnType;
    IMP aIMP = [self methodForSelector:aSelector];
    
#define _isType(TYPE)\
    (strncmp(rtype, @encode(TYPE), 1) == 0)
    
    if (_isType(id) || _isType(Class)) {
        id (*method)(id, SEL) = (id (*)(id, SEL))aIMP;
        return method(self, aSelector);
    }
    if (_isType(SEL) || _isType(char *)) {
        char * (*method)(id, SEL) = (char *(*)(id, SEL))aIMP;
        return [NSString stringWithCString:method(self, aSelector) encoding:NSUTF8StringEncoding];
    }
    if (_isType(void)) {
        void (*method)(id, SEL) = (void (*)(id, SEL))aIMP;
        method(self, aSelector);
        return nil;
    }
    
#define _isNumberThenReturn(INDEX, TYPE)\
    if (_isType(TYPE)) {\
        TYPE (*method)(id, SEL) = (TYPE (*)(id, SEL))aIMP;\
        return @(method(self, aSelector));\
    }
    metamacro_foreach(_isNumberThenReturn, ,
                      char, unsigned char,
                      short, unsigned short,
                      int, unsigned int,
                      long, unsigned long,
                      long long, unsigned long long,
                      float,
                      double)
    
    if (_isType(BOOL) || _isType(Boolean)) {
        BOOL (*method)(id, SEL) = (BOOL (*)(id, SEL))aIMP;
        return [NSNumber numberWithBool:method(self, aSelector)];
    }

    NSAssert(false, @"Unsupport method return type: %@", [NSString stringWithUTF8String:rtype]);
    return nil;
}

@end
