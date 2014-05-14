/*!
    NSObject extension
    RFKit

    Copyright (c) 2012-2014 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSObject (RFKit)

+ (void)defaultFill:(id)test with:(id)value;
- (id)get:(id)test defaults:(id)value;

- (NSArray *)objectsForIndexArray:(NSArray *)indexsArray;
- (NSArray *)objectsForDictKeyArray:(NSArray *)keyArray;

- (id)performRespondedSelector:(SEL)aSelector;

@end
