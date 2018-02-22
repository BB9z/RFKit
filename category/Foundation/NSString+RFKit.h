/*!
    NSString extension
    RFKit

    Copyright (c) 2012-2013, 2015, 2018 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSString (RFKit)

/**
 Calculate the MD5 value with given string.
 
 @return Uppercased md5 result.
 */
+ (nullable NSString *)MD5String:(nullable NSString *)string DEPRECATED_MSG_ATTRIBUTE("Use rf_MD5String instead.");

/**
 Calculate MD5 value with the reciver content.
 
 @return Lowercase md5 result.
 */
- (nonnull NSString *)rf_MD5String;

+ (nullable NSString *)pinyinFromString:(nullable NSString *)orgString DEPRECATED_MSG_ATTRIBUTE("Use rf_pinyinStringWithStripDiacritics: instead.");

/**
 Returns a new string transliterate to latin from ideographs interpreted as Mandarin Chinese.
 
 @code
 [@"中文" rf_pinyinStringWithStripDiacritics:NO];     // "zhōng wén"
 [@"中文, ö" rf_pinyinStringWithStripDiacritics:YES]; // "zhong wen, o"
 @endcode
 
 @param stripDiacritics A Boolean value that indicates whether should remove diacritic markings.
 */
- (nonnull NSString *)rf_pinyinStringWithStripDiacritics:(BOOL)stripDiacritics;

/**
 Returns a Boolean value indicating whether the receiver contains the specified string.
 
 @param string The string to check. This value must not be `nil`.

 @return `YES` if the receiver contains the string; otherwise, `NO`.
 */
- (BOOL)containsString:(nonnull NSString *)string;

/**
 Returns a Boolean value indicating whether the receiver contains the specified string.

 @param string The string to check. This value must not be `nil`.
 @param mask A mask specifying search options.

 @return `YES` if the receiver contains the string; otherwise, `NO`.
 */
- (BOOL)containsString:(nonnull NSString *)string options:(NSStringCompareOptions)mask;

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
- (nonnull NSString *)stringByTrimmingToLength:(NSUInteger)newLength withTruncationToken:(nullable NSString *)truncationToken;

/**
 Reverse a NSString
 
 @return String reversed
 */
- (nonnull NSString *)reverseString;

/**
 Remove HTML tags in receiver’s.
 
 This method just replace HTML tags with empty string using regular expression. The additonal spaces and line breaks in HTML are preserved.
 */
- (nonnull NSString *)extractedHTMLContent;

@end
