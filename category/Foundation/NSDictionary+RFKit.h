/*!
    NSDictionary extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDictionary (RFKit)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject;

- (BOOL)boolForKey:(NSString *)keyName;
- (float)floatForKey:(NSString *)keyName;
- (NSInteger)integerForKey:(NSString *)keyName;
- (double)doubleForKey:(NSString *)keyName;

@end

@interface NSMutableDictionary (RFKit)

- (NSUInteger)copyObjectsFromDictionary:(NSDictionary *)sourceDictionary withKeys:(NSString *)firstKey, ... NS_REQUIRES_NIL_TERMINATION;

- (void)setBool:(BOOL)value forKey:(NSString *)keyName;
- (void)setFloat:(float)value forKey:(NSString *)keyName;
- (void)setInteger:(NSInteger)value forKey:(NSString *)keyName;
- (void)setDouble:(double)value forKey:(NSString *)keyName;

@end