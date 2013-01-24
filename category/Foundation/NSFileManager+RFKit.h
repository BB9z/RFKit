/*!
    NSFileManager extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    http://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSFileManager (RFKit)
- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError **)erro;

/** Get file size of the given path.
    @return file size. If the file not exist, the return value will be 0. If error occurs, the return value will be -1.
 */
- (long long)fileSizeForPath:(NSString *)path;

@end
