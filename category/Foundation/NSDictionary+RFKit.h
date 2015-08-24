/*!
    NSDictionary extension
    RFKit

    Copyright (c) 2012-2015 BB9z
    https://github.com/BB9z/RFKit

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

/** Adds to the receiving dictionary the entries from another dictionary with specified keys.

 @param sourceDictionary The dictionary from which to add entries.
 @param firstKey ... Keys specifying which entry will be added to the reciver.
 */
- (NSUInteger)addEntriesFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(NSString *)firstKey, ... NS_REQUIRES_NIL_TERMINATION;

/** Adds a given key-value pair to the dictionary.
 
 @param anObject The value for aKey. Can be nil.
 @param aKey The key for value.
 */
- (void)rf_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

- (void)setBool:(BOOL)value forKey:(NSString *)keyName DEPRECATED_ATTRIBUTE;
- (void)setFloat:(float)value forKey:(NSString *)keyName DEPRECATED_ATTRIBUTE;
- (void)setInteger:(NSInteger)value forKey:(NSString *)keyName DEPRECATED_ATTRIBUTE;
- (void)setDouble:(double)value forKey:(NSString *)keyName DEPRECATED_ATTRIBUTE;

@end
