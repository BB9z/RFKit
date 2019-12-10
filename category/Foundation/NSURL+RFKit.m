
#import "NSURL+RFKit.h"


@implementation NSURL (RFKit)

static inline NSString *stringFromURLFormat(NSString *value) {
    return [[value stringByReplacingOccurrencesOfString:@"+" withString:@
             " "] stringByRemovingPercentEncoding];
}

- (nullable NSDictionary *)queryDictionary {
	NSString *queryString = self.query;
	if (!queryString) return nil;
	
	NSMutableDictionary *queryDictionary = [NSMutableDictionary dictionary];
	
	NSCharacterSet *charSetAmpersand = [NSCharacterSet characterSetWithCharactersInString:@"&"];
	NSCharacterSet *charSetEqualsSign = [NSCharacterSet characterSetWithCharactersInString:@"="];
	for (NSString *fieldValuePair in [queryString componentsSeparatedByCharactersInSet:charSetAmpersand]) {
		NSArray *fieldValueArray = [fieldValuePair componentsSeparatedByCharactersInSet:charSetEqualsSign];
		if (fieldValueArray.count == 2) {
            NSString *filed = stringFromURLFormat(fieldValueArray[0]);
            NSString *value = stringFromURLFormat(fieldValueArray[1]);
			queryDictionary[filed] = value;
		}
	}
	return queryDictionary;
}

@end
