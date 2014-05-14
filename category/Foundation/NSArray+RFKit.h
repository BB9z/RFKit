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
@end

@interface NSMutableArray (RFKit)

/** Filter a given dictionary with specified keys and adds these objects to the end of the receiving array’s content.

 @param sourceDictionary The dictionary from which to add entries
 @param firstKey ... Keys specifying which object will be added to the reciver.
 */
- (void)addObjectsFromDictionary:(NSDictionary *)sourceDictionary withSpecifiedKeys:(NSString *)firstKey, ...NS_REQUIRES_NIL_TERMINATION;
@end
