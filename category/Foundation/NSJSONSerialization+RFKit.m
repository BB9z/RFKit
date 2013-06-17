
#import "RFKit.h"
#import "NSJSONSerialization+RFKit.h"

@implementation NSJSONSerialization (RFKit)

+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)error {
    NSData *d = [NSJSONSerialization dataWithJSONObject:obj options:opt error:error];
    return RF_AUTORELEASE([[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding]);
}

+ (id)JSONObjectWithString:(NSString *)string usingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)error {
    NSData *d = [string dataUsingEncoding:encoding allowLossyConversion:lossy];
    if (!d) {
        return nil;
    }
    return [NSJSONSerialization JSONObjectWithData:d options:opt error:error];
}

+ (id)JSONObjectWithString:(NSString *)string {
    NSError *e = nil;
    id obj = [NSJSONSerialization JSONObjectWithString:string usingEncoding:NSUTF8StringEncoding allowLossyConversion:YES options:0 error:&e];
    if (e) dout_error(@"%@", e);
    return obj;
}

@end
