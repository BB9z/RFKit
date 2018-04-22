/*!
 NSBundle extension
 RFKit
 
 Copyright (c) 2012-2015, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSBundle (RFKit)

+ (nonnull NSString *)mainBundlePathForCaches API_AVAILABLE(ios(2.0));
+ (nonnull NSString *)mainBundlePathForPreferences API_AVAILABLE(ios(2.0));
+ (nonnull NSString *)mainBundlePathForDocuments API_AVAILABLE(ios(2.0));
+ (nonnull NSString *)mainBundlePathForTemp API_AVAILABLE(ios(2.0));

/**
 Get a path relative to NSHomeDirectory().
 
 @param path Relative path component
 */
+ (nonnull NSString *)pathForMainBoundlePath:(nonnull NSString *)path;

/**
 Bundle version string, according to Info.plist file.
 
 CFBundleShortVersionString + CFBundleVersion
 */
@property (nonnull, readonly) NSString *versionString API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));
@end
