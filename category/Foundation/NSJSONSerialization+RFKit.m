
#import "RFKit.h"
#import "NSJSONSerialization+RFKit.h"

@implementation NSJSONSerialization (RFKit)

+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error {
    NSData *d = [NSJSONSerialization dataWithJSONObject:obj options:opt error:error];
    return RF_AUTORELEASE([[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding]);
}

+ (id)JSONObjectWithString:(NSString *)string usingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy options:(NSJSONReadingOptions)opt error:(NSError **)error {
    NSData *d = [string dataUsingEncoding:encoding allowLossyConversion:lossy];
    return [NSJSONSerialization JSONObjectWithData:d options:opt error:error];
}


@end
