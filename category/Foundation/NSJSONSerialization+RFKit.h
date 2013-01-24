/*!
    NSJSONSerialization extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    http://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (RFKit)

/** Generate a string containing JSON data from a Foundation object.
 
 @param obj     The object from which to generate JSON data.
 @param opt     Options for creating the JSON data.
 @param error   If an error occurs, upon return contains an NSError object that describes the problem.

 @return A string encoded in UTF-8 containing JSON data.
 
 @discussion If the object will not produce valid JSON then an exception will be thrown. Setting the NSJSONWritingPrettyPrinted option will generate JSON with whitespace designed to make the output more readable. If that option is not set, the most compact possible JSON will be generated. If an error occurs, the error parameter will be set and the return value will be nil.
 */
+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error;


/** Returns a Foundation object from given JSON string.
  
 @param string  A string containing JSON data.
 @param encoding A string encoding.
 @param lossy   If YES, then allows characters to be removed or altered in conversion.
 @param opt     Options for reading the JSON data and creating the Foundation objects.
 @param error   If an error occurs, upon return contains an NSError object that describes the problem.

 @return A data object containing JSON string.
 
 @discussion This method use [NString dataUsingEncoding:allowLossyConversion:] cover the string to NSData, then use [NSJSONSerialization JSONObjectWithData:options:error:] cover the data object to Foundation object.
 */
+ (id)JSONObjectWithString:(NSString *)string usingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy options:(NSJSONReadingOptions)opt error:(NSError **)error ;
@end
