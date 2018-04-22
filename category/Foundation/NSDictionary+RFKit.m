
#import "NSDictionary+RFKit.h"
#import "NSObject+RFKit.h"

@implementation NSDictionary (RFKit)

- (BOOL)boolForKey:(id)aKey {
    return [self[aKey] boolValue];
}
- (NSInteger)integerForKey:(id)aKey {
    return [self[aKey] integerValue];
}
- (float)floatForKey:(id)aKey {
    return [self[aKey] floatValue];
}
- (double)doubleForKey:(id)aKey {
    return [self[aKey] doubleValue];
}

@end

@implementation NSMutableDictionary (RFKit)

- (NSUInteger)addEntriesFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(id)firstKey, ... {
    va_list ap;
    va_start(ap, firstKey);
    NSMutableArray *keys = NSMutableArray.new;
    for (id key = firstKey; key != nil; key = va_arg(ap, id)) {
        [keys addObject:key];
    }
    va_end(ap);
    return [self addEntriesFromDictionary:sourceDictionary filterKeys:keys];
}

- (NSUInteger)addEntriesFromDictionary:(NSDictionary *)sourceDictionary filterKeys:(NSArray *)keys {
    NSUInteger keyCopedCount = 0;
    for (id key in [NSSet.alloc initWithArray:keys]) {
        id tmp = sourceDictionary[key];
        if (tmp) {
            self[key] = tmp;
            keyCopedCount++;
        }
    }
    return keyCopedCount;
}

- (void)rf_setObject:(nullable id)anObject forKey:(nullable id)aKey {
    if (!anObject || !aKey) return;
    [self setObject:(id)anObject forKey:(id)aKey];
}

- (void)rf_removeObjectForKey:(nullable id)aKey {
    if (!aKey) return;
    [self removeObjectForKey:(id)aKey];
}

@end
