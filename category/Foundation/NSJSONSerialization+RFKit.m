
#import "RFRuntime.h"
#import "NSJSONSerialization+RFKit.h"

@implementation NSJSONSerialization (RFKit)

+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)error {
    if (!obj) return nil;
    NSData *d = [NSJSONSerialization dataWithJSONObject:obj options:opt error:error];
    return [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
}

+ (id)JSONObjectWithString:(NSString *)string usingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)error {
    NSData *d = [string dataUsingEncoding:encoding allowLossyConversion:lossy];
    if (!d) return nil;
    return [NSJSONSerialization JSONObjectWithData:d options:opt error:error];
}

+ (id)JSONObjectWithString:(NSString *)string {
    NSError *e = nil;
    id obj = [NSJSONSerialization JSONObjectWithString:string usingEncoding:NSUTF8StringEncoding allowLossyConversion:YES options:(NSJSONReadingOptions)0 error:&e];
    if (e) dout_error(@"%@", e);
    return obj;
}

//! REF: http://stackoverflow.com/a/17130821/945906
+ (id)JSONObjectWithJSONPString:(NSString *)JSONPString error:(NSError *__autoreleasing *)error {
    NSRange begin = [JSONPString rangeOfString:@"(" options:NSLiteralSearch];
    NSRange end = [JSONPString rangeOfString:@")" options:NSBackwardsSearch|NSLiteralSearch];
    BOOL invaild = (begin.location == NSNotFound || end.location == NSNotFound || end.location - begin.location < 2);
    if (invaild) {
        if (error) {
            *error = [NSError errorWithDomain:@"RFKit" code:0 userInfo:@{ NSLocalizedDescriptionKey : @"Not a vaild JSONP string." }];
        }
        return nil;
    }

    NSString *json = [JSONPString substringWithRange:NSMakeRange(begin.location + 1, (end.location - begin.location) - 1)];
    id obj = [NSJSONSerialization JSONObjectWithString:json usingEncoding:NSUTF8StringEncoding allowLossyConversion:YES options:(NSJSONReadingOptions)0 error:error];
    return obj;
}

@end
