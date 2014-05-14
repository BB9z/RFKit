//
//  NSFileManagerTests.m
//  RFKit
//
//  Created by BB9z on 13-6-23.
//  Copyright (c) 2013年 RFUI. All rights reserved.
//

#import "NSFileManagerTests.h"
#import "NSFileManager+RFKit.h"
#import "dout.h"

@implementation NSFileManagerTests

- (void)setUp {
    self.testDirPath = [[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"NSFileManagerTest"];
    ;
    XCTAssertTrue(([self isPath:self.testDirPath matchPathComponent:@"RFKit.app/NSFileManagerTest"]));
    
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    BOOL isExist = [fm fileExistsAtPath:self.testDirPath isDirectory:&isDir];
    XCTAssertTrue(isExist, @"Test dir not exist");
    XCTAssertTrue(isDir, @"Test dir not a directory");
}

- (void)testSubDirectoryURLWithPathComponentInDirectory {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError __autoreleasing *e = nil;
    BOOL isDir;
    BOOL isExist;
    NSString *targetPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/T1"];
    
    // Make sure path is clear
    [fm removeItemAtPath:targetPath error:nil];
    
    // Test: no creat
    NSURL *t1 = [fm subDirectoryURLWithPathComponent:@"T1" inDirectory:NSDocumentDirectory createIfNotExist:NO error:&e];
    XCTAssertTrue(([self isPath:t1.path matchPathComponent:@"Documents/T1"]));
    XCTAssertNil(e, @"Should not get a error");
    
    XCTAssertFalse([fm fileExistsAtPath:t1.path], @"Nothing should created");
    
    // Test: creat
    t1 = nil;
    t1 = [fm subDirectoryURLWithPathComponent:@"T1" inDirectory:NSDocumentDirectory createIfNotExist:YES error:&e];
    XCTAssertTrue(([self isPath:t1.path matchPathComponent:@"Documents/T1"]));
    XCTAssertNil(e, @"Should not get a error");
    isDir = NO;
    isExist = [fm fileExistsAtPath:t1.path isDirectory:&isDir];
    XCTAssertTrue(isDir && isExist, @"Creat dir fail");
    
    NSURL *t2 = [fm subDirectoryURLWithPathComponent:@"T1" inDirectory:NSDocumentDirectory createIfNotExist:YES error:&e];
    isDir = NO;
    isExist = [fm fileExistsAtPath:t2.path isDirectory:&isDir];
    XCTAssertTrue(isDir && isExist);
    
    
    [fm removeItemAtURL:t1 error:&e];
    XCTAssertNil(e, @"Should not get a error");
    
    [fm createFileAtPath:t1.path contents:[[NSData alloc] init] attributes:nil];
    isDir = NO;
    isExist = [fm fileExistsAtPath:t1.path isDirectory:&isDir];
    XCTAssertTrue(!isDir && isExist, @"Creat file fail");
    
    t1 = [fm subDirectoryURLWithPathComponent:@"T1" inDirectory:NSDocumentDirectory createIfNotExist:YES error:&e];
    XCTAssertNotNil(e, @"Should raise a error");
    XCTAssertNil(t1, @"Creat dir but file already exist, shoul be nil");
    
    // Clean
    e = nil;
    [fm removeItemAtPath:targetPath error:&e];
    XCTAssertNil(e, @"Should not get a error");
}

- (BOOL)isPath:(NSString *)path matchPathComponent:(NSString *)pathComponent {
    return [path isEqualToString:[NSHomeDirectory() stringByAppendingFormat:@"/%@", pathComponent]];
}

@end
