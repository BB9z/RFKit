
#import "RFKit.h"
#import "UIDevice+RFKit.h"
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>

@implementation UIDevice (RFKit)

+ (BOOL)isPad {
    static BOOL isPad = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            isPad = YES;
        }
    });
    return isPad;
}

+ (BOOL)isRetinaDisplay {
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

+ (NSString *)macAddress {
	int                 mgmtInfoBase[6];
	char                *msgBuffer = NULL;
	size_t              length;
	unsigned char       macAddress[6];
	struct if_msghdr    *interfaceMsgStruct;
	struct sockaddr_dl  *socketStruct;
	NSString            *errorFlag = NULL;
	
	// Setup the management Information Base (mib)
	mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
	mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
	mgmtInfoBase[2] = 0;
	mgmtInfoBase[3] = AF_LINK;        // Request link layer information
	mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
	
	// With all configured interfaces requested, get handle index
	if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0)
		errorFlag = @"if_nametoindex failure";
	else
	{
		// Get the size of the data available (store in len)
		if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0)
			errorFlag = @"sysctl mgmtInfoBase failure";
		else
		{
			// Alloc memory based on above call
			if ((msgBuffer = malloc(length)) == NULL)
				errorFlag = @"buffer allocation failure";
			else
			{
				// Get system information, store in buffer
				if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
					errorFlag = @"sysctl msgBuffer failure";
			}
		}
	}
	
	// Befor going any further...
	if (errorFlag != NULL)
	{
        dout_error(@"Error: %@", errorFlag)
		return errorFlag;
	}
	
	// Map msgbuffer to interface message structure
	interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
	
	// Map to link-level socket structure
	socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
	
	// Copy link layer address data in socket structure to an array
	memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
	
	// Read from char array into a string object, into traditional Mac address format
	NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
								  macAddress[0], macAddress[1], macAddress[2],
								  macAddress[3], macAddress[4], macAddress[5]];
	_dout(@"Mac Address: %@", macAddressString);
	
	// Release the buffer memory
	free(msgBuffer);
	
	return macAddressString;
}

+ (long long)fileSystemFreeSize {
    NSError *e = nil;
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&e];
    if (e) dout_warning(@"Can`t get file system free size, reason: %@", e);
    return [info[NSFileSystemFreeSize] longLongValue];
}

+ (long long)fileSystemSize {
    NSError *e = nil;
    NSDictionary *info = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&e];
    if (e) dout_warning(@"Can`t get file system size, reason: %@", e);
    return [info[NSFileSystemSize] longLongValue];
}

@end