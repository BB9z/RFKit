
#import "RFKit.h"
#import "UIButton+RFKit.h"

@implementation UIButton (RFKit)

// Reserved  Selected Disabled Highlighted
- (void)setResourceImage:(NSString *)imageName background:(NSString *)backGroundImageName {
	NSString * file = nil;
	NSString * type = @"png";
	
    if (imageName.length > 0) {
        file = [[NSBundle mainBundle] pathForResource:imageName ofType:type];
        if (file) {
            [self setImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateNormal];
        }
        
        file = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_highlighted",imageName] ofType:type];
        if (file) {
            [self setImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateHighlighted];
        }
        
        file = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_disabled",imageName] ofType:type];
        if (file) {
            [self setImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateDisabled];
        }
        
        file = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_selected",imageName] ofType:type];
        if (file) {
            [self setImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateSelected];
        }
    }
    else if ([imageName isEqualToString:@""]) {
        [self setImage:nil forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateHighlighted];
        [self setImage:nil forState:UIControlStateDisabled];
        [self setImage:nil forState:UIControlStateSelected];
    }
		
	if (backGroundImageName.length > 0) {
        file = [[NSBundle mainBundle] pathForResource:backGroundImageName ofType:type];
        if (file) {
            [self setBackgroundImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateNormal];
        }
        
        file = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_highlighted",backGroundImageName] ofType:type];
        if (file) {
            [self setBackgroundImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateHighlighted];
        }
        
        file = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_disabled",backGroundImageName] ofType:type]; 
        if (file) {
            [self setBackgroundImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateDisabled];
        }
        
        file = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_selected",backGroundImageName] ofType:type];
        if (file) {
            [self setBackgroundImage:[UIImage imageWithContentsOfFile:file] forState:UIControlStateSelected];
        }
    }
    else if ([backGroundImageName isEqualToString:@""]) {
        [self setBackgroundImage:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateHighlighted];
        [self setBackgroundImage:nil forState:UIControlStateDisabled];
        [self setBackgroundImage:nil forState:UIControlStateSelected];
    }
}

@end
  