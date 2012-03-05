/*!
 RFKit
 UIImage extension
 */
#import <UIKit/UIKit.h>

@interface UIImage (RFKit)
+ (UIImage *)resourceName:(NSString *)PNGFileName;
+ (UIImage *)resourceName:(NSString *)fileName ofType:(NSString *)type;

// @REF: http://stackoverflow.com/a/605385/945906
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)imageAspectFillSize:(CGSize)targetSize;
@end
