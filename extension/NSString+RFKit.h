/*!
    RFKit
    NSString extension

    Copyright (c) 2012 BB9z
    http://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSString (RFKit)

+ (NSString *)MD5String:(NSString *)string;

/** Reverse a NSString
 
 @return String reversed
 */
- (NSString *)reverseString;


/** 给定字体，屏幕长度，将字符串截断到指定长度
 
 这个方法不改变原始字符串
 @param length 屏幕长度
 @param font 计算所用字体
 @return 符合长度的字符串
 */
- (NSString *)stringTrimToWidthLength:(CGFloat)length WithFont:(UIFont *)font;

@end
