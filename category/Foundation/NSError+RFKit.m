
#import "NSError+RFKit.h"

@implementation NSError (RFKit)

+ (nonnull instancetype)errorWithDomain:(NSString *__nullable)domain code:(NSInteger)code localizedDescription:(NSString *__nullable)localizedDescription {
    NSDictionary *userInfo = localizedDescription? @{ NSLocalizedDescriptionKey : localizedDescription } : nil;
    NSError *e = [self errorWithDomain:domain?: [NSBundle mainBundle].bundleIdentifier code:code userInfo:userInfo];
    return e;
}

@end
