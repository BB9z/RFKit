
#import "RFRuntime.h"
#import "NSString+RFKit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (RFKit)

//! via: https://stackoverflow.com/q/1524604/945906
- (NSString *)rf_MD5String {
    const char *cStr = self.UTF8String;
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output.copy;
}

//! via: http://lldong.github.io/2012/11/06/hanzi-to-pinyin.html
- (nonnull NSString *)rf_pinyinStringWithStripDiacritics:(BOOL)stripDiacritics {
    NSMutableString *string = self.mutableCopy;
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    if (stripDiacritics) {
        CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    }
    return string;
}

#if (MAC_OS_X_VERSION_MIN_REQUIRED < __MAC_10_10 && (!defined(__IPHONE_OS_VERSION_MIN_REQUIRED) || __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0))
- (BOOL)containsString:(nonnull NSString *)string {
    return ([self rangeOfString:string].location != NSNotFound);
}
#endif

- (BOOL)containsString:(nonnull NSString *)string options:(NSStringCompareOptions)mask {
    return ([self rangeOfString:string options:mask].location != NSNotFound);
}

- (nonnull NSString *)reverseString {
    NSUInteger len = self.length;
	NSMutableString *reversedStr = [NSMutableString stringWithCapacity:len];
    while (len > 0) {
        NSString *s = [[NSString alloc] initWithFormat:@"%C", [self characterAtIndex:--len]];
		[reversedStr appendString:s];
    }
	return reversedStr;
}

- (nonnull NSString *)stringByTrimmingToLength:(NSUInteger)newLength withTruncationToken:(nullable NSString *)truncationToken {
    if (self.length <= newLength) {
        return [self copy];
    }

    if (truncationToken.length > newLength) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Truncation token string is longer than new length." userInfo:nil];
        return nil;
    }

    NSString *token = truncationToken?: @"";
    NSUInteger tokenLength = token.length;
    NSString *tmp = [self stringByPaddingToLength:newLength - tokenLength withString:@"" startingAtIndex:0];
    return [tmp stringByAppendingString:token];
}

- (nonnull NSString *)extractedHTMLContent {
    NSError __autoreleasing *e = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<(?:\"[^\"]*\"['\"]*|'[^']*'['\"]*|[^'\">])+>" options:NSRegularExpressionDotMatchesLineSeparators error:&e];
    if (e) dout_error(@"%@", e);
    return [regex stringByReplacingMatchesInString:self options:(NSMatchingOptions)0 range:NSMakeRange(0, self.length) withTemplate:@""];
}

@end
