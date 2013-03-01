/*!
    NSFileManager extension
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSFileManager (RFKit)
- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError **)erro;

/** Performs a deep search of the specified directory and returns URLs for the contained items which has given file extension.
 
 @param directory
     The URL for the directory whose contents you want to enumerate.

 @param fileTypes
     An set contains file extension strings you want to filter. nil will return all files.
     If you want filter files not have an extension, @"" should be added.
 
 @param mask
     Options for the enumeration. For a list of valid options, see “Directory Enumeration Options.”

 @param handler
     An optional 'errorHandler' block argument to call when an error occurs. The url parameter specifies the item for which the error occurred and the error parameter contains the error information. Your handler should return YES when it wants the enumeration to continue or NO when it wants the enumeration to stop.
 
 @return An array of NSURL.
 */
- (NSArray *)filesInDirectory:(NSURL *)directory withExtensions:(NSSet *)fileTypes directoryEnumerationOptions:(NSDirectoryEnumerationOptions)mask errorHandler:(BOOL (^)(NSURL *url, NSError *error))handler;

/** Get file size of the given path.
 
    @return file size. If the file not exist, the return value will be 0. If error occurs, the return value will be -1.
 */
- (long long)fileSizeForPath:(NSString *)path;

@end
