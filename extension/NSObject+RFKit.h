/*!
 RFKit
 NSObject extension
 */

#import <Foundation/Foundation.h>



@interface NSObject (RFKit)

+ (void)defaultFill:(id)test with:(id)value;
- (id)get:(id)test defaults:(id)value;

@end
