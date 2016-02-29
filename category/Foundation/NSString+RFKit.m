
#import "RFRuntime.h"
#import "NSString+RFKit.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (RFKit)

//! via: http://lldong.github.io/2012/11/06/hanzi-to-pinyin/
+ (NSString *)pinyinFromString:(NSString *)orgString {
    NSMutableString *string = [orgString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    return string;
}

- (BOOL)containsString:(NSString *)string {
    return ([self rangeOfString:string].location != NSNotFound);
}

- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)mask {
    return ([self rangeOfString:string options:mask].location != NSNotFound);
}

- (NSString *)reverseString {
	NSMutableString *reversedStr;
	NSUInteger len = self.length;
	
	// Auto released string
	reversedStr = [NSMutableString stringWithCapacity:len];     
	
	// Probably woefully inefficient...
	while (len > 0)
		[reversedStr appendString: [NSString stringWithFormat:@"%C", [self characterAtIndex:--len]]];   
	
	return reversedStr;
}

- (NSString *)stringByTrimmingToLength:(NSUInteger)newLength withTruncationToken:(NSString *)truncationToken {
    if (self.length <= newLength) {
        return [self copy];
    }

    if (truncationToken.length > newLength) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Truncation token string is longer than new length." userInfo:nil];
        return nil;
    }

    NSUInteger tokenLength = truncationToken.length;
    NSString *tmp = [self stringByPaddingToLength:newLength - tokenLength withString:@"" startingAtIndex:0];
    return [tmp stringByAppendingString:truncationToken?: @""];
}

//! via: http://stackoverflow.com/questions/1524604/md5-algorithm-in-objective-c
+ (NSString *)MD5String:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]]; 	
    
}

- (NSString *)extractedHTMLContent {
    NSError __autoreleasing *e = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<(?:\"[^\"]*\"['\"]*|'[^']*'['\"]*|[^'\">])+>" options:NSRegularExpressionDotMatchesLineSeparators error:&e];
    if (e) dout_error(@"%@", e);
    return [regex stringByReplacingMatchesInString:self options:(NSMatchingOptions)0 range:NSMakeRange(0, self.length) withTemplate:@""];
}

@end
