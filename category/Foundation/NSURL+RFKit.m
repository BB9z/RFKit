
#import "NSURL+RFKit.h"

@implementation NSURL (RFKit)

- (NSDictionary *)queryDictionary {
	NSString * queryString = self.query;
	if (!queryString) return nil;
	
	NSMutableDictionary *queryDictionary = [NSMutableDictionary dictionary];
	
	NSCharacterSet *charSetAmpersand = [NSCharacterSet characterSetWithCharactersInString:@"&"];
	NSCharacterSet *charSetEqualsSign = [NSCharacterSet characterSetWithCharactersInString:@"="];
	for (NSString *fieldValuePair in [queryString componentsSeparatedByCharactersInSet:charSetAmpersand]) {
		NSArray *fieldValueArray = [fieldValuePair componentsSeparatedByCharactersInSet:charSetEqualsSign];
		if (fieldValueArray.count == 2) {
			NSString *filed = fieldValueArray[0];
			NSString *value = fieldValueArray[1];
			queryDictionary[filed] = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		}
	}
	return queryDictionary;
}

@end
