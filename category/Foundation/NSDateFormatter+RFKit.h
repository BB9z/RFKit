/*!
    NSDateFormatter extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSDateFormatter (RFKit)

/** 符合GMT格式的NSDateFormatter
 
 日期格式为 yyyy-MM-ddT HH:mm:ssZ
 @return GMTFormatter
 */
+ (NSDateFormatter *)GMTFormatter;

+ (NSDateFormatter *)currentLocaleFormatter;
+ (NSDateFormatter *)currentLocaleFormatterOnlyDate;

@end
