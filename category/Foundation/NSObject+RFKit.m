
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

- (NSArray *)objectsForIndexArray:(NSArray *)indexsArray {
    NSUInteger indexCount = indexsArray.count;
    id ctObjectSet = self;
    
    for (NSUInteger i = 0; i < indexCount; i++) {
        id ctIndex = indexsArray[i];
        if ([ctIndex isKindOfClass:[NSNumber class]]) {
            if ([ctObjectSet respondsToSelector:@selector(objectAtIndex:)]) {
                NSNumber *indexObj = ctIndex;
                ctObjectSet = ctObjectSet[[indexObj intValue]];
            }
            else {
                @throw [NSException exceptionWithName:@"RFKit: Bad selector" reason:[NSString stringWithFormat:@"%@ can`t responds objectAtIndex: for index %@.", ctObjectSet, ctIndex] userInfo:@{@"set": self, @"indexsArray": indexsArray}];
            }
        }
        else {
            if ([ctObjectSet respondsToSelector:@selector(objectForKey:)]) {
                NSString *indexObj = ctIndex;
                ctObjectSet = ((NSDictionary *)ctObjectSet)[indexObj];
            }
            else {
                @throw [NSException exceptionWithName:@"RFKit: Bad selector" reason:[NSString stringWithFormat:@"%@ can`t responds objectForKey: for index %@.", ctObjectSet, ctIndex] userInfo:@{@"set": self, @"indexsArray": indexsArray}];
            }
        }
    }

    if (![ctObjectSet isKindOfClass:[NSArray class]]) {
        ctObjectSet = @[ctObjectSet];
    }
    return ctObjectSet;
}

- (NSArray *)objectsForDictKeyArray:(NSArray *)keyArray {
    // 空数组，第一个元素非NSString
    if (keyArray.count == 0 ||
        ![keyArray.firstObject isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    // 既不是数组也不是字典
    if (![self respondsToSelector:@selector(objectForKey:)] && ![self respondsToSelector:@selector(objectAtIndex:)]) {
        return nil;
    }

    id firstIndex = keyArray.firstObject;

    // 字典，只有一个key
    if (keyArray.count == 1 && [self respondsToSelector:@selector(objectForKey:)]) {
        id tmp = ((NSDictionary *)self)[firstIndex];
        if (tmp) {
             return @[tmp];
        }
        else {
            return nil;
        }
    }
    
    // keyArray.count >=1，参数无误
    // 字典或数组
    NSMutableArray *arrayFirstRemoved = [NSMutableArray arrayWithArray:keyArray];
    [arrayFirstRemoved removeObjectAtIndex:0];
    
    if ([self isKindOfClass:[NSArray class]]) {
        // Array
        NSMutableArray *r = [NSMutableArray arrayWithCapacity:20];
        
        for (id obj in (NSArray *)self) {
            id tmp = [obj objectsForDictKeyArray:keyArray];
            [r addObjectsFromArray:tmp];
        }
        return r;
    }
    else {
        // Dict
        id ctObjectSet = ((NSDictionary *)self)[firstIndex];
        return [ctObjectSet objectsForDictKeyArray:arrayFirstRemoved];
    }
}

- (nullable id)performRespondedSelector:(SEL)aSelector {
    if (![self respondsToSelector:aSelector]) return nil;
    NSMethodSignature *ms = [self methodSignatureForSelector:aSelector];
    NSAssert(ms, @"Cannot get method signature for %s", aSelector);
    NSAssert(ms.numberOfArguments == 2, @"The selector must have no arguments.");
    const char *rtype = ms.methodReturnType;
    IMP aIMP = [self methodForSelector:aSelector];
    
#define _isType(TYPE)\
    (strncmp(rtype, @encode(TYPE), 1) == 0)
    
    if (_isType(id) || _isType(Class)) {
        id (*method)(id, SEL) = (void *)aIMP;
        return method(self, aSelector);
    }
    if (_isType(SEL) || _isType(char *)) {
        char * (*method)(id, SEL) = (void *)aIMP;
        return [NSString stringWithCString:method(self, aSelector) encoding:NSUTF8StringEncoding];
    }
    if (_isType(void)) {
        id (*method)(id, SEL) = (void *)aIMP;
        method(self, aSelector);
        return nil;
    }
    if (_isType(BOOL) || _isType(Boolean) || _isType(boolean_t)) {
        BOOL (*method)(id, SEL) = (void *)aIMP;
        return [NSNumber numberWithBool:method(self, aSelector)];
    }
    
#define _isNumberThenReturn(INDEX, TYPE)\
    if (_isType(TYPE)) {\
        TYPE (*method)(id, SEL) = (void *)aIMP;\
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

    NSAssert(false, @"Unsupport method return type: %s", rtype);
    return nil;
}

@end
