/*!
    NSDictionary extension
    RFKit

    Copyright (c) 2012-2016, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSDictionary<KeyType, ObjectType> (RFKit)

/**
 Returns the Boolean value associated with the specified key.

 The value associated with the given key should be a NSNumber, NSString or any object responses `boolValue` method.
 
 @return The Boolean value associated with the specified key. If the specified key doesn‘t exist, this method returns NO.
 */
- (BOOL)boolForKey:(nonnull KeyType<NSCopying>)aKey API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

/**
 Returns the integer value associated with the specified key.
 
 The value associated with the given key should be a NSNumber, NSString or any object responses `integerValue` method.
 
 @return The integer value associated with the specified key. If the specified key doesn‘t exist, this method returns 0.
 */
- (NSInteger)integerForKey:(nonnull KeyType<NSCopying>)aKey API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

/**
 Returns the float value associated with the specified key.
 
 The value associated with the given key should be a NSNumber, NSString or any object responses `floatValue` method.
 
 @return The float value associated with the specified key. If the key doesn‘t exist, this method returns 0.
 */
- (float)floatForKey:(nonnull KeyType<NSCopying>)aKey API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

/**
 Returns the double value associated with the specified key.
 
 The value associated with the given key should be a NSNumber, NSString or any object responses `doubleValue` method.
 
 @return The double value associated with the specified key. If the key doesn‘t exist, this method returns 0.
 */
- (double)doubleForKey:(nonnull KeyType<NSCopying>)aKey API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

@end

@interface NSMutableDictionary<KeyType, ObjectType> (RFKit)

/**
 Adds to the receiving dictionary the entries from another dictionary with specified keys.

 @param sourceDictionary The dictionary from which to add entries.
 @param firstKey ... Keys specifying which entry will be added to the reciver.
 
 @bug If there is a duplicate key in the specified keys, the count is calculated repeatedly.
 
 @return Number of values added from sourceDictionary to the receiver.
 */
- (NSUInteger)addEntriesFromDictionary:(nullable NSDictionary *)sourceDictionary withSpecifiedKeys:(nullable KeyType<NSCopying>)firstKey, ... NS_REQUIRES_NIL_TERMINATION API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

/** 
 Safely adds a given key-value pair to the dictionary.
 
 @param anObject The value for aKey. Can be `nil`.
 @param aKey The key for value.
 */
- (void)rf_setObject:(nullable ObjectType)anObject forKey:(nullable KeyType<NSCopying>)aKey API_AVAILABLE(macos(10.0), ios(2.0), tvos(9.0), watchos(2.0));

/**
 Safely removes a given key and its associated value from the dictionary.
 
 @param aKey The key to remove. Can be `nil`.
 */
- (void)rf_removeObjectForKey:(nullable KeyType<NSCopying>)aKey API_AVAILABLE(macos(10.0), ios(2.0), tvos(9.0), watchos(2.0));

@end
