#import "RFKit.h"

@implementation UIButton (RFKit)

// Reserved  Selected Disabled Highlighted
- (void)setResourceImage:(NSString *)imageName background:(NSString *)backGroundImageName {
	NSString * file;
	NSString * type = @"png";
	
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

@end
  