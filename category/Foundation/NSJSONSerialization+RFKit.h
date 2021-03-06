/*!
 NSJSONSerialization extension
 RFKit
 
 Copyright (c) 2012-2015, 2018 BB9z
 http://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSJSONSerialization (RFKit)

/**
 Generate a string containing JSON data from a Foundation object.
 
 If the object will not produce valid JSON and not nil then an exception will be thrown. Setting the NSJSONWritingPrettyPrinted option will generate JSON with whitespace designed to make the output more readable. If that option is not set, the most compact possible JSON will be generated. If an error occurs, the error parameter will be set and the return value will be nil.
 
 @param obj     The object from which to generate JSON data. May be `nil`.
 @param opt     Options for creating the JSON data.
 @param error   If an error occurs, upon return contains an NSError object that describes the problem.

 @return A string encoded in UTF-8 containing JSON data.
 */
+ (nullable NSString *)stringWithJSONObject:(nullable id)obj options:(NSJSONWritingOptions)opt error:(NSError *__nullable __autoreleasing *__nullable)error API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0), watchos(2.0));

/**
 Returns a Foundation object from given JSON string.
 
 This method use [NString dataUsingEncoding:allowLossyConversion:] cover the string to NSData, then use [NSJSONSerialization JSONObjectWithData:options:error:] cover the data object to Foundation object.
  
 @param string  A string containing JSON data. May be `nil`.
 @param encoding A string encoding.
 @param lossy   If YES, then allows characters to be removed or altered in conversion.
 @param opt     Options for reading the JSON data and creating the Foundation objects.
 @param error   If an error occurs, upon return contains an NSError object that describes the problem.

 @return A data object containing JSON string.
 */
+ (nullable id)JSONObjectWithString:(nullable NSString *)string usingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy options:(NSJSONReadingOptions)opt error:(NSError *__nullable __autoreleasing *__nullable)error API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0), watchos(2.0));

/**
 Returns a Foundation object from given JSON string.
 
 This method use default JSON reading options to cover data object.
 
 @param string  An UTF-8 string containing JSON data. May be `nil`.
 
 @return A data object containing JSON string.
 
 @see [NSJSONSerialization JSONObjectWithString:usingEncoding:allowLossyConversion:options:error:]
 */
+ (nullable id)JSONObjectWithString:(nullable NSString *)string API_AVAILABLE(macos(10.7), ios(5.0), tvos(9.0), watchos(2.0));

/**
 Returns a Foundation object from given JSONP string.

 @param JSONPString An UTF-8 string containing JSONP data. May be `nil`.
 @param error       If an error occurs, upon return contains an NSError object that describes the problem.

 @return A data object containing JSON string.
 */
+ (nullable id)JSONObjectWithJSONPString:(nullable NSString *)JSONPString error:(NSError *__nullable __autoreleasing *__nullable)error API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

@end
