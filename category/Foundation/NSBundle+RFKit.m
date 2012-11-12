
#import "RFKit.h"
#import "NSBundle+RFKit.h"

@implementation NSBundle (RFKit)
+ (NSString *)mainBundlePathForCaches {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/"];
}

+ (NSString *)mainBundlePathForPreferences {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/"];
}

+ (NSString *)mainBundlePathForDocuments {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"];
}

+ (NSString *)mainBundlePathForTemp {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"/tmp/"];
}

+ (NSString *)pathForMainBoundlePath:(NSString *)path {
    return [NSHomeDirectory() stringByAppendingPathComponent:path];
}

+ (NSString *)versionString {
    NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"]];
    return [NSString stringWithFormat:@"%@.%@", [info objectForKey:@"CFBundleShortVersionString"], [info objectForKey:@"CFBundleVersion"]];
}
@end
