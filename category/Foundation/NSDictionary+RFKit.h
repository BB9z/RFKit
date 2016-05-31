/*!
    NSDictionary extension
    RFKit

    Copyright (c) 2012-2016 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDictionary<KeyType, ObjectType> (RFKit)

- (nullable id)objectForKey:(nonnull KeyType)aKey defaultMarker:(nullable ObjectType)anObject;

- (BOOL)boolForKey:(nonnull KeyType)aKey;
- (float)floatForKey:(nonnull KeyType)aKey;
- (NSInteger)integerForKey:(nonnull KeyType)aKey;
- (double)doubleForKey:(nonnull KeyType)aKey;

@end

@interface NSMutableDictionary<KeyType, ObjectType> (RFKit)

/** Adds to the receiving dictionary the entries from another dictionary with specified keys.

 @param sourceDictionary The dictionary from which to add entries.
 @param firstKey ... Keys specifying which entry will be added to the reciver.
 */
- (NSUInteger)addEntriesFromDictionary:(nullable NSDictionary *)sourceDictionary withSpecifiedKeys:(nullable KeyType)firstKey, ... NS_REQUIRES_NIL_TERMINATION;

/** 
 Safely adds a given key-value pair to the dictionary.
 
 @param anObject The value for aKey. Can be nil.
 @param aKey The key for value.
 */
- (void)rf_setObject:(nullable ObjectType)anObject forKey:(nullable KeyType)aKey;

/**
 Safely removes a given key and its associated value from the dictionary.
 
 @param akey The key to remove. Can be nil.
 */
- (void)rf_removeObjectForKey:(nullable KeyType)aKey;

@end
