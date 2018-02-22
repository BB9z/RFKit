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

- (nullable id)get:(nullable id)test defaults:(nullable id)value DEPRECATED_ATTRIBUTE;

- (nonnull NSArray<id> *)objectsForIndexArray:(nullable NSArray<id> *)indexsArray;
- (nullable NSArray<id> *)objectsForDictKeyArray:(nonnull NSArray<NSString *> *)keyArray;

/**
 Safely sends a specified message to the receiver and returns the result of the message.
 
 @param aSelector A selector identifying the message to send, may be NULL. The message must take no arguments or an `NSInvalidArgumentException` is raised.

 @return An object that is the result of the message.
    If the method return type is boolean or any basic number type, the result is wrapped in an NSNumber object.
    If the method return type is char * or selector, the result is wrapped in an NSString object.
    Other unsupport return type result an NSInvalidArgumentException` raised.
 */
- (nullable id)performRespondedSelector:(nullable SEL)aSelector;

@end
