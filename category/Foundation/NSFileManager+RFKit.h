/*!
    RFKit
    NSFileManager extension

    Copyright (c) 2012 BB9z
    http://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSFileManager (RFKit)
- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError **)erro;

- (unsigned long long)fileSizeForPath:(NSString *)path;


@end
