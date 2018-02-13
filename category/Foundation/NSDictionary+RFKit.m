
#import "NSDictionary+RFKit.h"
#import "NSObject+RFKit.h"

@implementation NSDictionary (RFKit)

- (id)objectForKey:(id<NSCopying>)aKey defaultMarker:(id)anObject {
	return [self get:self[aKey] defaults:anObject];
}

- (BOOL)boolForKey:(id<NSCopying>)aKey {
    return [self[aKey] boolValue];
}
- (float)floatForKey:(id<NSCopying>)aKey {
    return [self[aKey] floatValue];
}
- (NSInteger)integerForKey:(id<NSCopying>)aKey {
    return [self[aKey] integerValue];
}
- (double)doubleForKey:(id<NSCopying>)aKey {
    return [self[aKey] doubleValue];
}

@end

@implementation NSMutableDictionary (RFKit)

- (NSUInteger)addEntriesFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(id<NSCopying>)firstKey, ... {
    NSUInteger keyCopedCount = 0;
    va_list ap;
    va_start(ap, firstKey);
    for (id<NSCopying> key = firstKey; key != nil; key = va_arg(ap, id)) {
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
        [self setObject:(id)anObject forKey:(id)aKey];
    }
}

- (void)rf_removeObjectForKey:(nullable id<NSCopying>)aKey {
    if (aKey) {
        [self removeObjectForKey:(id)aKey];
    }
}

@end
