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

/**
 Returns a new string formed from the receiver by replacing characters with specified string from the end.

 Here are some examples of usage:
 
 @code
 [@"abcde" stringByTrimmingToLength:9 withTruncationToken:@"..."];
 // Result in "abcde"
 
 [@"abcde" stringByTrimmingToLength:5 withTruncationToken:@"..."];
 // Result in "abcde"

 [@"abcde" stringByTrimmingToLength:4 withTruncationToken:@"..."];
 // Result in "a..."
 @endcode
 
 @param newLength The new length for the receiver.
 @param truncationToken
    The string to apply to the truncation token at the end of the truncated string. This value may be nil.
    May raises an `NSInvalidArgumentException` if `truncationToken` is longer than `newLength`.

 @return A new string formed from the receiver by replacing characters with specified string from the end as necessary.
 */
- (NSString *)stringByTrimmingToLength:(NSUInteger)newLength withTruncationToken:(NSString *)truncationToken;

/** Reverse a NSString
 
 @return String reversed
 */
- (NSString *)reverseString;

/** Remove HTML tags in receiver’s.
 */
- (NSString *)extractedHTMLContent;

@end
