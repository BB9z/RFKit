
#import "dout.h"
#import <sys/sysctl.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunreachable-code"

void _dout_log_config(void) {
#ifdef DEBUG
    NSLog(@"DEBUG is %@", DEBUG? @"ON":@"OFF");
#else
    NSLog(@"DEBUG was not defined.");
#endif
    NSLog(@"RFDEBUG is %@", RFDEBUG? @"ON":@"OFF");
    NSLog(@"RFDebugLevel = %d", RFDebugLevel);
    NSLog(@"DOUT_FALG_TRACE is %@", DOUT_FALG_TRACE? @"ON":@"OFF");
    
    NSLog(@"DOUT_ASSERT_AT_ERROR is %@", DOUT_ASSERT_AT_ERROR? @"ON":@"OFF");
    NSLog(@"DOUT_ASSERT_AT_WANRNING is %@", DOUT_ASSERT_AT_WANRNING? @"ON":@"OFF");
    NSLog(@"DOUT_TREAT_ERROR_AS_EXCEPTION is %@", DOUT_TREAT_ERROR_AS_EXCEPTION? @"ON":@"OFF");
    NSLog(@"DOUT_TREAT_WANRNING_AS_EXCEPTION is %@", DOUT_TREAT_WANRNING_AS_EXCEPTION? @"ON":@"OFF");
}
#pragma clang diagnostic pop

bool DoutIsBeingDebugged(void) {
    struct kinfo_proc info;
    info.kp_proc.p_flag = 0;

    int mib[4];
    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_PID;
    mib[3] = getpid();

    size_t size = sizeof(info);
    sysctl(mib, sizeof(mib) / sizeof(*mib), &info, &size, NULL, 0);

    return ((info.kp_proc.p_flag & P_TRACED) != 0);
}

void DoutLogString(NSString *string) {
    static BOOL usingPrintf = NO;
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        usingPrintf = DoutIsBeingDebugged();
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH':'mm':'ss'.'SSS"];
    });
    
    if (!usingPrintf) {
        NSLog(@"%@", string);
        return;
    }
    
    NSString *timeString = [dateFormatter stringFromDate:[NSDate date]];
    NSString *threadFlag = @"";
    if (![NSThread isMainThread]) {
        threadFlag = [NSString stringWithFormat:@"(%@)", DoutCurrentThreadOrQueueName()];
    }

    printf("%s\n", [[NSString stringWithFormat:@"%@%@: %@", timeString, threadFlag, string] UTF8String]);
}

NSString *DoutCurrentThreadOrQueueName(void) {
    NSString *threadName = [NSThread currentThread].name;
    if (threadName.length) {
        return threadName;
    }

    NSString *queueName = @(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
    if (queueName.length) {
        return queueName;
    }

    return [NSString stringWithFormat:@"%p", (void *)[NSThread currentThread]];
}
