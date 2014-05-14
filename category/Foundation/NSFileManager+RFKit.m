
#import "RFKit.h"
#import "NSFileManager+RFKit.h"

@implementation NSFileManager (RFKit)

- (NSURL *)subDirectoryURLWithPathComponent:(NSString *)pathComponent inDirectory:(NSSearchPathDirectory)directory createIfNotExist:(BOOL)createIfNotExist error:(NSError *__autoreleasing *)error {

    NSURL *parentDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:directory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:error];
    NSURL *directoryURL = [parentDirectoryURL URLByAppendingPathComponent:pathComponent? pathComponent : @""];
    
    BOOL isDirectory = YES;
    if ([self fileExistsAtPath:[directoryURL path] isDirectory:&isDirectory] && !isDirectory) {
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

- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
	NSMutableArray * sub = [[self contentsOfDirectoryAtPath:path error:error] mutableCopy];
	_douto(sub)
	
	BOOL isDir = false;
	NSString * tmpPath = nil;
	for (NSInteger i = sub.count - 1; i >= 0; i--) {
		tmpPath = [path stringByAppendingPathComponent:sub[i]];
		
		if ([self fileExistsAtPath:tmpPath isDirectory:&isDir] && isDir) {
			[sub replaceObjectAtIndex:i withObject:tmpPath];
		}
		else {
			[sub removeObjectAtIndex:i];
		}
	}
	_douto(sub)
	return [NSArray arrayWithArray:sub];
}

- (NSArray *)filesInDirectory:(NSURL *)directory withExtensions:(NSSet *)fileTypes directoryEnumerationOptions:(NSDirectoryEnumerationOptions)mask errorHandler:(BOOL (^)(NSURL *url, NSError *error))handler {
    
    NSError *e = nil;
#define _RFKit_NSFileManager_handleError \
    if (e && handler) {\
        handler(fileURL, e);\
        e = nil;\
    }

    NSMutableArray *fileArray = [NSMutableArray array];
    
    NSDirectoryEnumerator *dirEnumerator = [self enumeratorAtURL:directory includingPropertiesForKeys:@[NSURLNameKey, NSURLIsDirectoryKey] options:mask errorHandler:handler];
    for (NSURL *fileURL in dirEnumerator) {
        NSNumber *isDirectory;
        [fileURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&e];
        _RFKit_NSFileManager_handleError
        if ([isDirectory boolValue]) continue;
        
        NSString *fileName = nil;
        [fileURL getResourceValue:&fileName forKey:NSURLNameKey error:&e];
        _RFKit_NSFileManager_handleError
        
        if (fileTypes.count == 0 || [fileTypes member:[fileName pathExtension]]) {
            [fileArray addObject:fileURL];
        }
    }
    return fileArray;
#undef _RFKit_NSFileManager_handleError
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

- (long long)sizeForDirectory:(NSString *)directoryPath fileCount:(int *)fileCount directoryCount:(int *)directoryCount error:(NSError *__autoreleasing *)inputError {
    long long fileSize = 0;
    BOOL isDir = NO;
    BOOL isExist = [self fileExistsAtPath:directoryPath isDirectory:&isDir];
    int cFile = 0;
    int cDir = 0;
    
    if ((!isExist || !isDir) && inputError) {
        *inputError = [NSError errorWithDomain:@"com.github.RFKit.NSFileManager" code:-1 userInfo:@{ NSLocalizedDescriptionKey : @"Given path is not a directory." }];
        return 0;
    }
    
    NSEnumerator *fileEnumerator = [self enumeratorAtPath:directoryPath];
    NSString *fileName;
    NSError *error = nil;
    while ((fileName = [fileEnumerator nextObject])) {
        NSString *file = [directoryPath stringByAppendingPathComponent:fileName];
        if (![self fileExistsAtPath:file isDirectory:&isDir]) continue;
        
        if (isDir) {
            cDir++;
            continue;
        }

        NSDictionary *fileDict = [self attributesOfItemAtPath:file error:&error];
        if (error) {
            _dout_error(@"%@", error);
            continue;
        }
        
        fileSize += [fileDict fileSize];
        cFile++;
    }
    
    if (error && inputError) {
        *inputError = error;
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
