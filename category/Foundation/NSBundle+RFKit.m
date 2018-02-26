
#import "NSBundle+RFKit.h"

@implementation NSBundle (RFKit)

+ (nonnull NSString *)mainBundlePathForCaches {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/"];
}

+ (nonnull NSString *)mainBundlePathForPreferences {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/"];
}

+ (nonnull NSString *)mainBundlePathForDocuments {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"];
}

+ (nonnull NSString *)mainBundlePathForTemp {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/tmp/"];
}

+ (nonnull NSString *)pathForMainBoundlePath:(nonnull NSString *)path {
    return [NSHomeDirectory() stringByAppendingPathComponent:path];
}

- (nonnull NSString *)versionString {
    NSString *bundleVersion = self.infoDictionary[@"CFBundleVersion"];
    NSString *shortVersion = self.infoDictionary[@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@.%@", shortVersion, bundleVersion];
}

@end
