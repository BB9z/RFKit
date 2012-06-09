
#import <Foundation/Foundation.h>

@interface NSDictionary (RFKit)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject;
@end

@interface NSMutableDictionary (RFKit)

- (NSUInteger)copyObjectsFromDictionary:(NSDictionary *)sourceDictionary withKeys:(NSString *)firstKey, ... NS_REQUIRES_NIL_TERMINATION;
@end