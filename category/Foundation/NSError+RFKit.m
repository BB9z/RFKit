
#import "NSError+RFKit.h"

@implementation NSError (RFKit)

+ (nonnull instancetype)errorWithDomain:(nullable NSString *)domain code:(NSInteger)code localizedDescription:(nullable NSString *)localizedDescription {
    NSDictionary *userInfo = nil;
    if (localizedDescription) {
        userInfo = @{ NSLocalizedDescriptionKey : (id)localizedDescription };
    }
    NSString *dm = domain?: [NSBundle mainBundle].bundleIdentifier;
    NSError *e = [self errorWithDomain:dm?: NSCocoaErrorDomain code:code userInfo:userInfo];
    return e;
}

@end
