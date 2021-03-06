/*!
 NSError extension
 RFKit
 
 Copyright (c) 2015, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"

@interface NSError (RFKit)

/**
 Creates and initializes a NSError object for a given domain, code and localized description.
 
 @param domain The error domain—this can be one of the predefined NSError domains, or an arbitrary string describing a custom domain. If nil, application’s bundle identifier (if available) or `NSCocoaErrorDomain` will be used.
 @param code The error code for the error.
 @param localizedDescription Customized localized description of the error
 
 @return A NSError object for domain with the specified error code and the localized description.
 */
+ (nonnull instancetype)errorWithDomain:(nullable NSString *)domain code:(NSInteger)code localizedDescription:(nullable NSString *)localizedDescription API_AVAILABLE(macos(10.8), ios(6.0), tvos(9.0), watchos(2.0));

@end
