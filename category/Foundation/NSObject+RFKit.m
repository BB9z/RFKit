
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
