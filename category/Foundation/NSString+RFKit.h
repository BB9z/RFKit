/*!
    NSString extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSString (RFKit)

+ (NSString *)MD5String:(NSString *)string;

// 
+ (NSString *)pinyinFromString:(NSString *)orgString;

 
 */


/** Reverse a NSString
 
 @return String reversed
 */
- (NSString *)reverseString;

- (NSString *)stringTrimToWidthLength:(CGFloat)length WithFont:(UIFont *)font DEPRECATED_ATTRIBUTE;


@end
