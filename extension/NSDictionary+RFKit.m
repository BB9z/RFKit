
#import "RFKit.h"
#import "NSDictionary+RFKit.h"

@implementation NSDictionary (RFKit)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject {
	return [self get:[self objectForKey:aKey] defaults:anObject];
}

- (BOOL)boolForKey:(NSString *)keyName {
    return [[self objectForKey:keyName] boolValue];
}
- (float)floatForKey:(NSString *)keyName {
    return [[self objectForKey:keyName] floatValue];
}
- (NSInteger)integerForKey:(NSString *)keyName {
    return [[self objectForKey:keyName] integerValue];
}
- (double)doubleForKey:(NSString *)keyName {
    return [[self objectForKey:keyName] doubleValue];
}

@end

@implementation NSMutableDictionary (RFKit)

- (NSUInteger)copyObjectsFromDictionary:(NSDictionary *)sourceDictionary withKeys:(NSString *)firstKey, ... {
    NSUInteger keyCopedCount = 0;
    va_list ap;
    va_start(ap, firstKey);
    for (NSString *key = firstKey; key != nil; key = va_arg(ap, id)) {
        id tmp = [sourceDictionary objectForKey:key];
        if (tmp) {
            [self setObject:tmp forKey:key];
            keyCopedCount++;
        }
    }
    va_end(ap);
    return keyCopedCount;
}

- (void)setBool:(BOOL)value forKey:(NSString *)keyName {
    [self setObject:[NSNumber numberWithBool:value] forKey:keyName];
}
- (void)setFloat:(float)value forKey:(NSString *)keyName {
    [self setObject:[NSNumber numberWithFloat:value] forKey:keyName];
}
- (void)setInteger:(NSInteger)value forKey:(NSString *)keyName {
    [self setObject:[NSNumber numberWithInteger:value] forKey:keyName];
}
- (void)setDouble:(double)value forKey:(NSString *)keyName {
    [self setObject:[NSNumber numberWithDouble:value] forKey:keyName];
}

@end
