
#import "dout.h"

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
