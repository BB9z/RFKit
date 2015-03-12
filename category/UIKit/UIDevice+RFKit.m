
#import "UIDevice+RFKit.h"
#import <sys/sysctl.h>
#import "dout.h"

@implementation UIDevice (RFKit)

- (BOOL)isPad {
    static BOOL isPad = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([self userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            isPad = YES;
        }
    });
    return isPad;
}

- (BOOL)isRetinaDisplay {
    static BOOL isRetinaDisplay = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)]
            && [UIScreen mainScreen].scale == 2.0) {
            isRetinaDisplay = YES;
        }
    });
    return isRetinaDisplay;
}

- (long long)fileSystemFreeSize {
    NSError *e = nil;
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&e];
    if (e || !info[NSFileSystemFreeSize]) {
        dout_warning(@"Can`t get file system free size, reason: %@", e);
        return -1;
    }
    return [info[NSFileSystemFreeSize] longLongValue];
}

- (long long)fileSystemSize {
    NSError *e = nil;
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&e];
    if (e || !info[NSFileSystemSize]) {
        dout_warning(@"Can`t get file system size, reason: %@", e);
        return -1;
    }
    return [info[NSFileSystemSize] longLongValue];
}

- (BOOL)isBeingDebugged {
    int                 junk;
    int                 mib[4];
    struct kinfo_proc   info;
    size_t              size;
    
    // Initialize the flags so that, if sysctl fails for some bizarre
    // reason, we get a predictable result.
    info.kp_proc.p_flag = 0;
    
    // Initialize mib, which tells sysctl the info we want, in this case
    // we're looking for information about a specific process ID.
    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();
    
    // Call sysctl.
    size = sizeof(info);
    junk = sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);
    RFAssert(junk == 0, nil);
    
    // We're being debugged if the P_TRACED flag is set.
    return ( (info.kp_proc.p_flag & P_TRACED) != 0 );
}

@end
