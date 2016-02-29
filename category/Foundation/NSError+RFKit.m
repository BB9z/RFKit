
#import "NSError+RFKit.h"

@implementation NSError (RFKit)

+ (nonnull instancetype)errorWithDomain:(NSString *__nullable)domain code:(NSInteger)code localizedDescription:(NSString *__nullable)localizedDescription {
    NSDictionary *userInfo = localizedDescription? @{ NSLocalizedDescriptionKey : localizedDescription } : nil;
    NSString *dm = domain?: [NSBundle mainBundle].bundleIdentifier;
    NSError *e = [self errorWithDomain:dm?: NSCocoaErrorDomain code:code userInfo:userInfo];
    return e;
}

@end
