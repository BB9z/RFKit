
#import "RFKit.h"
#import "NSArray+RFKit.h"

@implementation NSArray (RFKit)

@end

@implementation NSMutableArray (RFKit)

- (void)addObjectsFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(NSString *)firstKey, ... {
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
