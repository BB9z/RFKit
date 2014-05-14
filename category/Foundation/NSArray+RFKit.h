/*!
    NSArray extension
    RFKit

    Copyright (c) 2012-2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSArray (RFKit)

/**
 Returns the object located at the specified index.
 
 If index is beyond the end of the array, nil will be returned.

 @param index An index within the bounds of the array.
 
 @return The object located at index.
 */
- (id)rf_objectAtIndex:(NSUInteger)index;
@end

@interface NSMutableArray (RFKit)

/** Filter a given dictionary with specified keys and adds these objects to the end of the receiving array’s content.

 @param sourceDictionary The dictionary from which to add entries
 @param firstKey ... Keys specifying which object will be added to the reciver.
 */
- (void)addObjectsFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(NSString *)firstKey, ...NS_REQUIRES_NIL_TERMINATION;
@end
