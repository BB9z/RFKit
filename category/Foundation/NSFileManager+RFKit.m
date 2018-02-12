
#import "RFRuntime.h"
#import "NSFileManager+RFKit.h"

@implementation NSFileManager (RFKit)

- (NSURL *)subDirectoryURLWithPathComponent:(NSString *)pathComponent inDirectory:(NSSearchPathDirectory)directory createIfNotExist:(BOOL)createIfNotExist error:(NSError *__autoreleasing *)error {

    NSURL *parentDirectoryURL = [self URLForDirectory:directory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:error];
    NSURL *directoryURL = [parentDirectoryURL URLByAppendingPathComponent:pathComponent? pathComponent : @""];
    
    BOOL isDirectory = YES;
    if ([self fileExistsAtPath:(NSString *)[directoryURL path] isDirectory:&isDirectory] && !isDirectory) {
        if (error) {
            *error = [NSError errorWithDomain:@"com.github.RFKit.NSFileManager" code:-1 userInfo:@{ NSLocalizedDescriptionKey : @"A file already exists at the loaction." }];
        }
        return nil;
    }

    if (createIfNotExist) {
        if (![self createDirectoryAtURL:directoryURL withIntermediateDirectories:YES attributes:nil error:error]) {
            return nil;
        }
    }

    return directoryURL;
}

- (NSArray<NSString *> *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
	NSMutableArray *sub = [[self contentsOfDirectoryAtPath:path error:error] mutableCopy];
	_douto(sub)
	
	BOOL isDir = false;
	NSString * tmpPath = nil;
	for (NSInteger i = sub.count - 1; i >= 0; i--) {
		tmpPath = [path stringByAppendingPathComponent:sub[i]];
		
		if ([self fileExistsAtPath:tmpPath isDirectory:&isDir] && isDir) {
			sub[i] = tmpPath;
		}
		else {
			[sub removeObjectAtIndex:i];
		}
	}
	_douto(sub)
	return [NSArray arrayWithArray:sub];
}

- (NSArray<NSURL *> *)filesInDirectory:(NSURL *)directory withExtensions:(NSSet *)fileTypes directoryEnumerationOptions:(NSDirectoryEnumerationOptions)mask errorHandler:(BOOL (^)(NSURL *url, NSError *error))handler {
    
    NSError *e = nil;
#define RFKit_NSFileManager_handleError_ \
    if (e && handler) {\
        handler(fileURL, e);\
        e = nil;\
    }

    NSMutableArray *fileArray = [NSMutableArray array];
    
    NSDirectoryEnumerator *dirEnumerator = [self enumeratorAtURL:directory includingPropertiesForKeys:@[NSURLNameKey, NSURLIsDirectoryKey] options:mask errorHandler:handler];
    for (NSURL *fileURL in dirEnumerator) {
        @autoreleasepool {
            NSNumber *isDirectory;
            [fileURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&e];
            RFKit_NSFileManager_handleError_
            if ([isDirectory boolValue]) continue;
            
            NSString *fileName = nil;
            [fileURL getResourceValue:&fileName forKey:NSURLNameKey error:&e];
            RFKit_NSFileManager_handleError_
            
            if (!fileTypes.count
                || [fileTypes member:[fileName pathExtension]]) {
                [fileArray addObject:fileURL];
            }
        }
    }
    return fileArray;
#undef RFKit_NSFileManager_handleError_
}

- (long long)fileSizeForPath:(NSString *)path {
    return [self fileSizeForPath:path error:nil];
}

- (long long)fileSizeForPath:(NSString *)path error:(NSError *__autoreleasing *)inputError {
    BOOL isDir = NO;
    if (![self fileExistsAtPath:path isDirectory:&isDir]) {
        return 0;
    }
    
    if (isDir) {
        return [self sizeForDirectory:path fileCount:NULL directoryCount:NULL error:inputError];
    }
    
    NSError *error = nil;
    NSDictionary *fileDict = [self attributesOfItemAtPath:path error:&error];
    if (error && inputError) {
        *inputError = error;
        return -1;
    }
    
    return fileDict.fileSize;
}

//! REF: https://stackoverflow.com/a/28660040/945906
- (long long)sizeForDirectory:(NSString *)directoryPath fileCount:(long *)fileCount directoryCount:(long *)directoryCount error:(NSError *__autoreleasing *)inputError {

    long long fileSize = 0;
    BOOL isDir = NO;
    BOOL isExist = [self fileExistsAtPath:directoryPath isDirectory:&isDir];
    long cFile = 0;
    long cDir = 0;
    
    if (!isExist || !isDir) {
        if (inputError) {
            *inputError = [NSError errorWithDomain:@"com.github.RFKit.NSFileManager" code:-1 userInfo:@{ NSLocalizedDescriptionKey : @"Given path is not a directory." }];
        }
        return 0;
    }
    
    __block NSError *error = nil;
    NSEnumerator *fileEnumerator = [self enumeratorAtURL:[NSURL fileURLWithPath:directoryPath] includingPropertiesForKeys:@[
        NSURLIsDirectoryKey,
        NSURLFileSizeKey,
    ] options:(NSDirectoryEnumerationOptions)0 errorHandler:nil];
    // Continues to enumerate items when an error occurs, or lead to breaking change.

    for (NSURL *file in fileEnumerator) {
        @autoreleasepool {
            if (error) {
                break;
            }
        
            NSNumber *isDirObj = nil;
            if (![file getResourceValue:&isDirObj forKey:NSURLIsDirectoryKey error:&error]) break;
            if (isDirObj.boolValue) {
                cDir++;
                continue;
            }
            
            NSNumber *fileSizeObj;
            if (![file getResourceValue:&fileSizeObj forKey:NSURLFileSizeKey error:&error]) break;
            
            fileSize += fileSizeObj.longLongValue;
            cFile++;
        }
    }
    
    if (error) {
        if (inputError) {
            *inputError = error;
        }
        return -1;
    }
    
    if (fileCount) {
        *fileCount = cFile;
    }
    if (directoryCount) {
        *directoryCount = cDir;
    }
    return fileSize;
}

@end
