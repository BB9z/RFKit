
#import "RFKit.h"
#import "NSURL+RFKit.h"

@implementation NSURL (RFKit)


- (NSDictionary *)queryDictionary {
	NSString * queryString = [self query];
	if (!queryString) return nil;
	
	NSMutableDictionary *queryDictionary = [NSMutableDictionary dictionary];
	
	NSCharacterSet *charSetAmpersand = [NSCharacterSet characterSetWithCharactersInString:@"&"];
	NSCharacterSet *charSetEqualsSign = [NSCharacterSet characterSetWithCharactersInString:@"="];
	for (NSString *fieldValuePair in [queryString componentsSeparatedByCharactersInSet:charSetAmpersand]) {
		NSArray *fieldValueArray = [fieldValuePair componentsSeparatedByCharactersInSet:charSetEqualsSign];
		if (fieldValueArray.count == 2) {
			NSString *filed = [fieldValueArray objectAtIndex:0];
			NSString *value = [fieldValueArray objectAtIndex:1];
			[queryDictionary setObject:[value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:filed];
		}
	}
	_douto(queryDictionary)
	return queryDictionary;
}
@end
