
#import "RFKit.h"
#import "NSFileManager+RFKit.h"

@implementation NSFileManager (RFKit)

- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError **)error{
	NSMutableArray * sub = [NSMutableArray arrayWithArray:[self contentsOfDirectoryAtPath:path error:error]];
	_douto(sub)
	
	BOOL isDir = false;
	NSString * tmpPath = nil;
	for (int i = [sub count]-1;i>=0;i--) {
		tmpPath = [path stringByAppendingPathComponent:[sub objectAtIndex:i]];
		
		if([self fileExistsAtPath:tmpPath isDirectory:&isDir] && isDir){
			[sub replaceObjectAtIndex:i withObject:tmpPath];
		}
		else{
			[sub removeObjectAtIndex:i];
		}
		
	}
	_douto(sub)
	return [NSArray arrayWithArray:sub];
}

@end
