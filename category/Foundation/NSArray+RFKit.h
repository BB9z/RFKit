/*!
    NSArray extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSArray (RFKit)

- (id)firstObject;
@end

@interface NSMutableArray (RFKit)
- (void)addObjectsFromDictionary:(NSDictionary *)otherDictionary keys:(NSString *)firstKey, ...NS_REQUIRES_NIL_TERMINATION;
@end
