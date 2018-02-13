/*!
    NSObject extension
    RFKit

    Copyright (c) 2012-2016, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSObject (RFKit)

- (id _Nullable)get:(id _Nullable)test defaults:(id _Nullable)value DEPRECATED_ATTRIBUTE;

- (NSArray<id> *_Nonnull)objectsForIndexArray:(NSArray<id> *_Nullable)indexsArray;
- (NSArray<id> *_Nullable)objectsForDictKeyArray:(NSArray<NSString *> *_Nonnull)keyArray;

- (id _Nullable)performRespondedSelector:(SEL _Nonnull)aSelector;

@end
