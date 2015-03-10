
#import "RFKit.h"
#import "NSArray+RFKit.h"

@implementation NSArray (RFKit)

- (id)rf_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }

    return self[index];
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

@end
