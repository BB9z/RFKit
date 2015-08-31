/*!
    NSError extension
    RFKit

    Copyright (c) 2015 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import <Foundation/Foundation.h>

@interface NSError (RFKit)

/**
 Creates and initializes an NSError object for a given domain and code with a given localized description.
 
 @param domain The error domain—this can be one of the predefined NSError domains, or an arbitrary string describing a custom domain. If nil, application’s bundle identifier will be used.
 @param code The error code for the error.
 @param localizedDescription Customized localized description of the error
 
 @return An NSError object for domain with the specified error code and the localized description.
 */
+ (nonnull instancetype)errorWithDomain:(NSString *__nullable)domain code:(NSInteger)code localizedDescription:(NSString *__nullable)localizedDescription;

@end
