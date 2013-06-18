
#import "dout.h"
#import "UIDevice+RFKit.h"

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

void DoutLogString(NSString *string) {
    static BOOL usingPrintf = NO;
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        usingPrintf = [UIDevice currentDevice].isBeingDebugged;
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

NSString * DoutCurrentThreadOrQueueName(void) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    NSString *queueName = [NSString stringWithCString:dispatch_queue_get_label(dispatch_get_current_queue()) encoding:NSUTF8StringEncoding];
#pragma clang diagnostic pop
    NSString *threadName = [NSThread currentThread].name;
    
    if (threadName.length) {
        return threadName;
    }
    else if (queueName.length) {
        return queueName;
    }
    else {
        return [NSString stringWithFormat:@"%p", [NSThread currentThread]];
    }
}
