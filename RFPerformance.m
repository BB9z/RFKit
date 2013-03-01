

#import "RFPerformance.h"

// for Memory log
#import <mach/mach.h>

@interface RFPerformance () {
    time_t timeBase;
}
@end

@implementation RFPerformance
@synthesize timeTable = _timeTable;

+ (RFPerformance *)sharedInstance {
    static RFPerformance *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
	return sharedInstance;
}

- (RFPerformance *)init {
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
	return fabsf(time);
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
