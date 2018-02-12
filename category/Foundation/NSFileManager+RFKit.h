/*!
    NSFileManager extension
    RFKit

    Copyright (c) 2012-2015, 2018 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSFileManager (RFKit)

/**
 Get a NSURL object of the specified directory in an search path directory.
 
 @param pathComponent
     The path component of the sub directory. May be nil.
 
 @param directory
     The search path directory. The supported values are described in NSSearchPathDirectory.
 
 @param createIfNotExist
     If `YES`, the directory and it´s any non-existent parent directories will be creat. If `NO`, only return the url.
 
 @param error
     If an error occurs, upon return contains an NSError object that describes the problem. Pass NULL if you do not want error information.
 
 @return A URL pointing to the directory, or nil if the url is a file or error occurs.
 */
- (nullable NSURL *)subDirectoryURLWithPathComponent:(nullable NSString *)pathComponent inDirectory:(NSSearchPathDirectory)directory createIfNotExist:(BOOL)createIfNotExist error:(NSError *__nullable __autoreleasing *__nullable)error;

/**
 Get subdirectories under the specified directory.
 
 @param path
     The path for the directory.
 
 @param error
     If an error occurs, upon return contains an NSError object that describes the problem. Pass NULL if you do not want error information.
 
 @return An array of absolute paths.
 */
- (nonnull NSArray<NSString *> *)subDirectoryOfDirectoryAtPath:(nonnull NSString *)path error:(NSError *__nullable __autoreleasing *__nullable)error;

/**
 Performs a deep search of the specified directory and returns URLs for the contained items which has given file extension.
 
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
- (nonnull NSArray<NSURL *> *)filesInDirectory:(nonnull NSURL *)directory withExtensions:(nullable NSSet *)fileTypes directoryEnumerationOptions:(NSDirectoryEnumerationOptions)mask errorHandler:(nullable BOOL (^)(NSURL *__nonnull url, NSError *__nonnull error))handler;

/**
 Get file size of the given path, support directory. This method will not traverse any symbolic link.
 
 @return file size. If the file not exist, the return value will be 0. If error occurs, the return value will be -1.
 */
- (long long)fileSizeForPath:(nullable NSString *)path error:(NSError *__nullable __autoreleasing *__nullable)error;

/// @see fileSizeForPath:error:.
- (long long)fileSizeForPath:(nullable NSString *)path DEPRECATED_MSG_ATTRIBUTE("Use fileSizeForPath:error: instead");

/**
 Get size of a directory, include file count and subdirectory count in that directory.
 
 This method will not traverse any symbolic link, but the alias file size will be calculated. The returned size is not on disk size.
 
 @warning This method traverse the contents of the directory. It may takes a lot of time and block the thread if there are lots of file.
 
 @bug If part of the directory is inaccessible, the rest part will still be calculated and there is no error.
 
 @return Directory size. Return 0 when the path is not a directory. Return -1 when any error occurs.
 */
- (long long)sizeForDirectory:(nullable NSString *)directoryPath fileCount:(nullable long *)fileCount directoryCount:(nullable long *)directoryCount error:(NSError *__nullable __autoreleasing *__nullable)error;

@end
