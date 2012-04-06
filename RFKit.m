#import "RFKit.h"

#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <mach/mach.h>

@interface RFKit (/* private */)

@end


@implementation RFKit
@synthesize timeTable;

static RFKit *sharedInstance = nil;
+ (RFKit *)sharedKit {
	if (sharedInstance == nil) {
		@synchronized(sharedInstance) {
			if (sharedInstance == nil) {
				sharedInstance = [[self alloc] init];
			}
		}
	}
	return sharedInstance;
}

- (RFKit *)init {
	self = [super init];
	if (self) {
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] initWithCapacity:20];
		self.timeTable = tmp;
		RF_RELEASE_OBJ(tmp)
		timeBase = clock();
	}
	return self;
}

- (void)dealloc {
	self.timeTable = nil;
	
	RF_DEALLOC_OBJ(super)
}

+ (void)rls:(id)first,... {
	va_list ap;
	va_start(ap, first);
	for (id obj = first; obj != nil; obj = va_arg(ap, id))
		RF_RELEASE_OBJ(obj)
	va_end(ap);
}

+ (void)performBlock:(void (^)(id))block afterDelay:(NSTimeInterval)delay on:(id)firstObject,... {
	va_list ap;
	va_start(ap, firstObject);
	for (id obj = firstObject; obj != nil; obj = va_arg(ap, id)) {
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * delay), dispatch_get_main_queue(), ^{
			block(obj);
		});
	}
	va_end(ap);
}

- (time_t)addTimePoint:(NSString *)name {
	time_t t = clock();
	NSNumber * tmpTime = [[NSNumber alloc] initWithFloat:(t-timeBase)/(double)CLOCKS_PER_SEC];
	if ([self.timeTable objectForKey:name]) {
		dout(@"Warning: A time point with the same name already existed.");
	}
	[self.timeTable setObject:tmpTime forKey:name];
	RF_RELEASE_OBJ(tmpTime);
	return t;
}

- (float)timeBetween:(NSString *)name1 another:(NSString *)name2 {
	float time1 = [(NSNumber *)[self.timeTable objectForKey:name1] floatValue];
	float time2 = [(NSNumber *)[self.timeTable objectForKey:name2] floatValue];
	float time = time1 - time2;
	return ABS(time);
}

+ (NSString *)getMacAddress {
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
		NSLog(@"Error: %@", errorFlag);
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

+ (void)logMemoryInfo {
    vm_statistics_data_t vmStats;
    
	mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
	
    if (kernReturn == KERN_SUCCESS){
        NSLog(@"free: %u\nactive: %u\ninactive: %u\nwire: %u\nzero fill: %u\nreactivations: %u\npageins: %u\npageouts: %u\nfaults: %u\ncow_faults: %u\nlookups: %u\nhits: %u",
			  vmStats.free_count * vm_page_size,
			  vmStats.active_count * vm_page_size,
			  vmStats.inactive_count * vm_page_size,
			  vmStats.wire_count * vm_page_size,
			  vmStats.zero_fill_count * vm_page_size,
			  vmStats.reactivations * vm_page_size,
			  vmStats.pageins * vm_page_size,
			  vmStats.pageouts * vm_page_size,
			  vmStats.faults,
			  vmStats.cow_faults,
			  vmStats.lookups,
			  vmStats.hits
			  );
    }
}
@end


#pragma mark -
#pragma mark NSDictionary 扩展
@implementation NSDictionary (extension)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject {
	return [super get:[self objectForKey:aKey] defaults:anObject];
}

@end


#pragma mark -
#pragma mark NSDateFormatter 扩展
@implementation NSDateFormatter (extension)

+ (NSDateFormatter *)GMTFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
		[share setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	}
	return RF_AUTORELEASE([share copy]);
}

+ (NSDateFormatter *)currentLocaleFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
	}
	return RF_AUTORELEASE([share copy]);
}

+ (NSDateFormatter *)currentLocaleFormatterOnlyDate {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd'"];
	}
	return RF_AUTORELEASE([share copy]);
}

@end


#pragma mark -
#pragma mark UIViewController 扩展
@implementation UIViewController (extension)

- (void)setNavTitle:(NSString *)title back:(NSString *)backTitle{
	self.title = title;
	UIBarButtonItem * tmpBack = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:nil];
	self.navigationItem.backBarButtonItem = tmpBack;
	RF_RELEASE_OBJ(tmpBack);
}

@end


#pragma mark -
#pragma mark NSFileManager 扩展
@implementation NSFileManager (extension)
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


#pragma mark -
#pragma mark NSFileManager 扩展
@implementation NSBundle (extension)
+ (NSString *)mainBundlePathForCaches {
	static NSString * path =nil;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/"]];
	}
	return path;
}

+ (NSString *)mainBundlePathForPreferences {
	static NSString * path =nil;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/"]];
	}
	return path;
}

+ (NSString *)mainBundlePathForDocuments {
	static NSString * path;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]];
	}
	return path;
}

+ (NSString *)mainBundlePathForTemp {
	static NSString * path =nil;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/tmp/"]];
	}
	return path;
}

@end
