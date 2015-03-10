/*!
    NSString extension
    RFKit

    Copyright (c) 2012-2013, 2015 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSString (RFKit)

+ (NSString *)MD5String:(NSString *)string;

// 
+ (NSString *)pinyinFromString:(NSString *)orgString;

/** Returns a Boolean value indicating whether the receiver contains the specified string.
 
 @param string The string to check. This value must not be `nil`.

 @return `YES` if the receiver contains the string; otherwise, `NO`.
 */
- (BOOL)containsString:(NSString *)string;

/** Returns a Boolean value indicating whether the receiver contains the specified string.

 @param string The string to check. This value must not be `nil`.
 @param mask A mask specifying search options. The following options may be specified by combining them with the C bitwise OR operator: NSCaseInsensitiveSearch, NSLiteralSearch, NSBackwardsSearch, NSAnchoredSearch. See String Programming Guide for details on these options.

 @return `YES` if the receiver contains the string; otherwise, `NO`.
 */
- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)mask;

/** Reverse a NSString
 
 @return String reversed
 */
- (NSString *)reverseString;

/** Remove HTML tags in receiver’s.
 */
- (NSString *)extractedHTMLContent;

@end
