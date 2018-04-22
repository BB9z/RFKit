/*!
 NSObject extension
 RFKit
 
 Copyright (c) 2012-2016, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSObject (RFKit)

/**
 Get objects through array or dictionary like object.

 @code
 NSArray *a = @[
     NSNull.null,
     @{
         @"a": @{
             @"1": @"got"
         },
         @"b": NSNull.null
     }
 ];
 [a objectsForIndexArray:@[ @1, @"a", @"1" ]]   // [ "got" ]
 @endcode
 
 @param indexsArray An array which the elements are NSNumber or NSString.
 
 @return An array contains specified objects.
 */
- (nonnull NSArray<id> *)objectsForIndexArray:(nullable NSArray<id> *)indexsArray API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

/**
 Extracte objects from array or dictionary like object.
 
 @code
 NSArray *a = @[
     @200
     @{
         @"ID": @1
     },
     @{
         @"ID": @2
     },
     @{
         @"foo": @"bar"
     },
     @[
         @{
             @"ID": @3
         }
     ]
 ];
 [a objectsForDictKeyArray:@[ @"ID" ]];    // [ 1, 2, 3 ]
 @endcode
 
 @param keyArray An array contains dictionary keys.
 
 @return An array contains extracted objects. If can not get specified objects, nil returns.
 */
- (nullable NSArray<id> *)objectsForDictKeyArray:(nullable NSArray<NSString *> *)keyArray API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

/**
 Safely sends a specified message to the receiver and returns the result of the message.
 
 @param aSelector A selector identifying the message to send, may be NULL. The message must take no arguments or an `NSInvalidArgumentException` is raised.

 @return An object that is the result of the message.
    If the method return type is boolean or any basic number type, the result is wrapped in an NSNumber object.
    If the method return type is char * or selector, the result is wrapped in an NSString object.
    Other unsupport return type result an NSInvalidArgumentException` raised.
 */
- (nullable id)performRespondedSelector:(nullable SEL)aSelector API_AVAILABLE(macos(10.4), ios(2.0), tvos(9.0), watchos(2.0));

@end
