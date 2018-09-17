
#import "NSArray+RFKit.h"

@implementation NSArray (RFKit)

- (nullable id)rf_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }

    return self[index];
}

- (nonnull NSArray *)rf_subarrayWithRangeLocation:(const NSInteger)location length:(const NSInteger)length {
    const NSInteger count = self.count;
    NSInteger loc = (location >= 0)? location : count + location;
    NSInteger len = length;
    if (len < 0) {
        len = -len;
        loc -= len - 1;
    }

    NSInteger to = loc + len;
    if (to < 0
        || loc > count) {
        return @[];
    }

    if (loc < 0) {
        loc = 0;
    }
    if (to > count) {
        to = count;
    }
    NSRange range = NSMakeRange(loc, to - loc);
    return [self subarrayWithRange:range];
}


- (nonnull NSMutableArray *)rf_mapedArrayWithBlock:(NS_NOESCAPE id _Nullable (^_Nonnull)(id _Nonnull))block {
    NSMutableArray *map = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id value = block(obj);
        [map rf_addObject:value];
    }];
    return map;
}

@end

@implementation NSMutableArray (RFKit)

- (void)rf_addObject:(nullable id)anObject {
    if (!anObject) return;
    [self addObject:(id)anObject];
}

- (void)rf_insertObject:(nullable id)anObject atIndex:(NSUInteger)index {
    if (!anObject) return;
    if (index > self.count) return;
    [self insertObject:(id)anObject atIndex:index];
}

- (void)addObjectsFromDictionary:(nullable NSDictionary *)sourceDictionary withSpecifiedKeys:(nonnull NSString *)firstKey, ... {
    va_list ap;
    va_start(ap, firstKey);
    for (NSString *key = firstKey; key != nil; key = va_arg(ap, id)) {
        id tmp = sourceDictionary[key];
        if (tmp) {
            [self addObject:tmp];
        }
    }
    va_end(ap);
}

- (void)setLastObject:(nullable id)anObject {
    if (!anObject) return;
    NSInteger idx = self.count - 1;
    if (idx < 0) {
        idx = 0;
    }
    self[idx] = (id)anObject;
}

- (void)removeObjectsPassingTest:(NS_NOESCAPE BOOL (^__nonnull)(id __nonnull obj, NSUInteger idx, BOOL *__nonnull stop))predicate {
    NSIndexSet *is = [self indexesOfObjectsPassingTest:predicate];
    [self removeObjectsAtIndexes:is];
}

@end
