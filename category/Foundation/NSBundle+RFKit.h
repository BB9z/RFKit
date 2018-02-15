/*!
    NSBundle extension
    RFKit

    Copyright (c) 2012-2015, 2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

@interface NSBundle (RFKit)

+ (nonnull NSString *)mainBundlePathForCaches;
+ (nonnull NSString *)mainBundlePathForPreferences;
+ (nonnull NSString *)mainBundlePathForDocuments;
+ (nonnull NSString *)mainBundlePathForTemp;

/**
 Get a path relative to NSHomeDirectory().
 
 @param path Relative path component
 */
+ (nonnull NSString *)pathForMainBoundlePath:(nullable NSString *)path;

/**
 Bundle version string, according to Info.plist file.
 
 CFBundleShortVersionString + CFBundleVersion
 */
- (nonnull NSString *)versionString;
@end
