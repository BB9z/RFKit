
#import "NSArray+RFKit.h"

@implementation NSArray (RFKit)

- (id)rf_objectAtIndex:(NSUInteger)index {
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

@end

@implementation NSMutableArray (RFKit)

- (void)rf_addObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)rf_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) return;
    if (index > self.count) return;
    [self insertObject:anObject atIndex:index];
}

- (void)addObjectsFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(NSString *)firstKey, ... {
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

- (void)setLastObject:(id)anObject {
    if (anObject) {
        NSInteger idx = self.count - 1;
        if (idx < 0) {
            idx = 0;
        }
        self[idx] = anObject;
    }
}

- (void)removeObjectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    NSIndexSet *is = [self indexesOfObjectsPassingTest:predicate];
    [self removeObjectsAtIndexes:is];
}

@end
