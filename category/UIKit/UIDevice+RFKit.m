
#import "UIDevice+RFKit.h"
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>

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

- (NSString *)macAddress {
	int                 mgmtInfoBase[6];
	char                *msgBuffer = NULL;
	size_t              length;
	unsigned char       macAddress[6];
	struct if_msghdr    *interfaceMsgStruct;
	struct sockaddr_dl  *socketStruct;
	
	// Setup the management Information Base (mib)
	mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
	mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
	mgmtInfoBase[2] = 0;
	mgmtInfoBase[3] = AF_LINK;        // Request link layer information
	mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
	
	// With all configured interfaces requested, get handle index
	if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0) {
        dout_error(@"Get mac address failed: if_nametoindex failure");
        return nil;
    }

    // Get the size of the data available (store in len)
    if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0) {
        dout_error(@"Get mac address failed: sysctl mgmtInfoBase failure");
        return nil;
    }
    
    // Alloc memory based on above call
    if ((msgBuffer = malloc(length)) == NULL) {
        dout_error(@"Get mac address failed: buffer allocation failure");
        return nil;
    }
    
    // Get system information, store in buffer
    if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0) {
        dout_error(@"Get mac address failed: sysctl msgBuffer failure");
        free(msgBuffer);
        return nil;
    }
	
	// Map msgbuffer to interface message structure
	interfaceMsgStruct = (struct if_msghdr *)msgBuffer;
	
	// Map to link-level socket structure
	socketStruct = (struct sockaddr_dl *)(interfaceMsgStruct + 1);
	
	// Copy link layer address data in socket structure to an array
	memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
	
	// Read from char array into a string object, into traditional Mac address format
	NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", macAddress[0], macAddress[1], macAddress[2], macAddress[3], macAddress[4], macAddress[5]];
	
	free(msgBuffer);
	return macAddressString;
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
