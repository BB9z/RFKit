
#import "RFKit.h"
#import "NSArray+RFKit.h"

@implementation NSArray (RFKit)

- (id)firstObject {
    return (self!=nil && self.count>0) ? [self objectAtIndex:0] : nil;
}

@end

@implementation NSMutableArray (RFKit)

- (void)addObjectsFromDictionary:(NSDictionary *)sourceDictionary keys:(NSString *)firstKey, ... {
    va_list ap;
    va_start(ap, firstKey);
    for (NSString *key = firstKey; key != nil; key = va_arg(ap, id)) {
        id tmp = [sourceDictionary objectForKey:key];
        if (tmp) {
            [self addObject:tmp];
        }
    }
    va_end(ap);
}

@end
