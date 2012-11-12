
#import "RFKit.h"
#import "NSString+RFKit.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (RFKit)


+ (NSString *)pinyinFromString:(NSString *)orgString {
    NSMutableString *string = [orgString mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    return RF_AUTORELEASE(string);
}

- (NSString *)reverseString {
	NSMutableString *reversedStr;
	int len = [self length];
	
	// Auto released string
	reversedStr = [NSMutableString stringWithCapacity:len];     
	
	// Probably woefully inefficient...
	while (len > 0)
		[reversedStr appendString: [NSString stringWithFormat:@"%C", [self characterAtIndex:--len]]];   
	
	return reversedStr;
}

- (NSString *)stringTrimToWidthLength:(CGFloat)length WithFont:(UIFont *)font {
	NSString * tmp = self;
	CGFloat ctLength;
	NSUInteger charNumToRemove;
	CGFloat aLetterWidthSafe = [@"汉" sizeWithFont:font].width*1.5;
	bool trimed = false;
	
	while ((ctLength = [tmp sizeWithFont:font].width) > length) {
		charNumToRemove = (ctLength-length)/aLetterWidthSafe;
		if (charNumToRemove == 0) {
			charNumToRemove = 1;
		}
		tmp = [tmp substringToIndex:([tmp length] - charNumToRemove)];
		trimed = true;
	}

	return trimed ? [NSString stringWithFormat:@"%@...", tmp] : RF_AUTORELEASE([self copy]);
}


+ (NSString *)MD5String:(NSString *)string {
    // Borrowed from: http://stackoverflow.com/questions/652300/using-md5-hash-on-a-string-in-cocoa
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],result[8], result[9], result[10], result[11],result[12], result[13], result[14], result[15]]; 	
    
}

@end
