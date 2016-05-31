/*!
    NSArray extension
    RFKit

    Copyright (c) 2012-2016 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSArray<ObjectType> (RFKit)

/**
 Returns the object located at the specified index safely.
 
 If index is beyond the end of the array, nil will be returned.

 @param index An index within the bounds of the array.
 
 @return The object located at index.
 */
- (nullable ObjectType)rf_objectAtIndex:(NSUInteger)index;

/**
 Safely returns a new array containing the receiving array’s elements that fall within the limits specified by a given range which may out of the receiving array’s range.

 Both location and length can be negative.

 @code

 NSArray *a = @[ @1, @2, @3, @4, @5 ];
 [a rf_subarrayWithRangeLocation: 1 length: 2];   // [2, 3]
 [a rf_subarrayWithRangeLocation: 1 length:99];   // [2, 3, 4, 5]
 [a rf_subarrayWithRangeLocation: 1 length: 0];   // [ ]
 [a rf_subarrayWithRangeLocation: 1 length:-1];   // [2]
 [a rf_subarrayWithRangeLocation: 1 length:-5];   // [1, 2]
 [a rf_subarrayWithRangeLocation:99 length: 2];   // [ ]
 [a rf_subarrayWithRangeLocation:-1 length:-2];   // [4, 5] Last two items
 [a rf_subarrayWithRangeLocation:-1 length:-99];  // [1, 2, 3, 4, 5]
 [a rf_subarrayWithRangeLocation:-5 length: 2];   // [1, 2]

 @endcode
 */
- (nonnull NSArray<ObjectType> *)rf_subarrayWithRangeLocation:(NSInteger)location length:(NSInteger)length;

@end

@interface NSMutableArray<ObjectType> (RFKit)

/**
 Inserts a given object at the end of the array safely.
 
 @param anObject The object to add to the end of the array's content. This value can be `nil`.
 */
- (void)rf_addObject:(nullable ObjectType)anObject;

/**
 Inserts a given object into the array's contents at a given index safely.

 @param anObject    The object to add to the array's content. This value can be `nil`.
 @param index       The index in the array at which to insert anObject. If index is beyond the end of the array, nothing hanppaned.
 */
- (void)rf_insertObject:(nullable ObjectType)anObject atIndex:(NSUInteger)index;


/** Filter a given dictionary with specified keys and adds these objects to the end of the receiving array’s content.

 @param sourceDictionary The dictionary from which to add entries
 @param firstKey ... Keys specifying which object will be added to the reciver.
 */
- (void)addObjectsFromDictionary:(nullable NSDictionary *)sourceDictionary withSpecifiedKeys:(nullable NSString *)firstKey, ...NS_REQUIRES_NIL_TERMINATION;

/**
 Replaces last object in the array. If the array is empty, the object will be added as first object.
 
 @param anObject The object with which to replace the last object in the array. If this value is nil, takes no effect.
 */
- (void)setLastObject:(nullable ObjectType)anObject;

/**
 Removes the objects that pass the test in a given block.

 @param predicate The block to apply to elements in the array.
 */
- (void)removeObjectsPassingTest:(BOOL (^_Nonnull)(ObjectType _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop))predicate;

@end
