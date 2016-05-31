
#import "NSDictionary+RFKit.h"
#import "NSObject+RFKit.h"

@implementation NSDictionary (RFKit)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject {
	return [self get:self[aKey] defaults:anObject];
}

- (BOOL)boolForKey:(id<NSCopying>)keyName {
    return [self[keyName] boolValue];
}
- (float)floatForKey:(id<NSCopying>)keyName {
    return [self[keyName] floatValue];
}
- (NSInteger)integerForKey:(id<NSCopying>)keyName {
    return [self[keyName] integerValue];
}
- (double)doubleForKey:(id<NSCopying>)keyName {
    return [self[keyName] doubleValue];
}

@end

@implementation NSMutableDictionary (RFKit)

- (NSUInteger)addEntriesFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(NSString *)firstKey, ... {
    NSUInteger keyCopedCount = 0;
    va_list ap;
    va_start(ap, firstKey);
    for (NSString *key = firstKey; key != nil; key = va_arg(ap, id)) {
        id tmp = sourceDictionary[key];
        if (tmp) {
            self[key] = tmp;
            keyCopedCount++;
        }
    }
    va_end(ap);
    return keyCopedCount;
}

- (void)rf_setObject:(nullable id)anObject forKey:(nullable id<NSCopying>)aKey {
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

- (void)rf_removeObjectForKey:(nullable id)aKey {
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
}

@end
