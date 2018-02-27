

#import "RFPerformance.h"
#import "dout.h"
// for Memory log
#import <mach/mach.h>

@implementation RFPerformance

//! REF: http://www.keakon.net/2011/08/12/获取iOS设备的内存状况
+ (void)logMemoryInfo {
    vm_statistics_data_t vmStats;
    
	mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
	
    if (kernReturn == KERN_SUCCESS) {
        dout(@"free: %lu\nactive: %lu\ninactive: %lu\nwire: %lu\nzero fill: %lu\nreactivations: %lu\npageins: %lu\npageouts: %lu\nfaults: %u\ncow_faults: %u\nlookups: %u\nhits: %u",
			  (unsigned long)vmStats.free_count * vm_page_size,
			  (unsigned long)vmStats.active_count * vm_page_size,
			  (unsigned long)vmStats.inactive_count * vm_page_size,
			  (unsigned long)vmStats.wire_count * vm_page_size,
			  (unsigned long)vmStats.zero_fill_count * vm_page_size,
			  (unsigned long)vmStats.reactivations * vm_page_size,
			  (unsigned long)vmStats.pageins * vm_page_size,
			  (unsigned long)vmStats.pageouts * vm_page_size,
			  vmStats.faults,
			  vmStats.cow_faults,
			  vmStats.lookups,
			  vmStats.hits
			  );
    }
}

@end
