
#import "NSDictionary+RFKit.h"

@implementation NSDictionary (RFKit)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject {
	return [self get:[self objectForKey:aKey] defaults:anObject];
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

@end
