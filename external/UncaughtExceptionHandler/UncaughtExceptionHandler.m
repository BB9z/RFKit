//
//  UncaughtExceptionHandler.m
//  UncaughtExceptions
//
//  Created by Matt Gallagher on 2010/05/25.
//  Copyright 2010 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "UncaughtExceptionHandler.h"
#include <libkern/OSAtomic.h>
#include <execinfo.h>
#import "RFRuntime.h"

void HandleException(NSException *exception);
void SignalHandler(int signal);

static NSString * const UncaughtExceptionHandlerSignalExceptionName = @"UncaughtExceptionHandlerSignalExceptionName";
static NSString * const UncaughtExceptionHandlerSignalKey = @"UncaughtExceptionHandlerSignalKey";
static NSString * const UncaughtExceptionHandlerAddressesKey = @"UncaughtExceptionHandlerAddressesKey";

static volatile int32_t UncaughtExceptionCount = 0;
static const int32_t UncaughtExceptionMaximum = 10;

static const NSInteger UncaughtExceptionHandlerSkipAddressCount = 4;
static const NSInteger UncaughtExceptionHandlerReportAddressCount = 5;

@interface UncaughtExceptionHandler () {
    BOOL dismissed;
}

@end

@implementation UncaughtExceptionHandler

+ (NSArray *)backtrace {
	 void* callstack[128];
	 int frames = backtrace(callstack, 128);
	 char **strs = backtrace_symbols(callstack, frames);
	 
	 int i;
	 NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
	 for (i = UncaughtExceptionHandlerSkipAddressCount; i < UncaughtExceptionHandlerSkipAddressCount + UncaughtExceptionHandlerReportAddressCount;
		i++) {
         NSString *part = [NSString stringWithUTF8String:strs[i]];
         if (part) {
             [backtrace addObject:part];
         }
	 }
	 free(strs);
	 
	 return backtrace;
}

- (void)alertView:(UIAlertView *)anAlertView clickedButtonAtIndex:(NSInteger)anIndex {
	if (anIndex == 0) {
		dismissed = YES;
	}
}

- (void)validateAndSaveCriticalApplicationData {
	
}

- (void)handleException:(NSException *)exception {
	[self validateAndSaveCriticalApplicationData];
	
	UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Unhandled exception", nil)
                    message:[NSString stringWithFormat:NSLocalizedString(
                                                                          @"You can try to continue but the application may be unstable.\n\n"
                                                                          @"Debug details follow:\n%@\n%@", nil),
                              [exception reason],
                              [exception userInfo][UncaughtExceptionHandlerAddressesKey]]
                     delegate:self
                     cancelButtonTitle:NSLocalizedString(@"Quit", nil)
                     otherButtonTitles:NSLocalizedString(@"Continue", nil), nil];
    RF_AUTORELEASE_OBJ(alert)
	[alert show];
	
	CFRunLoopRef runLoop = CFRunLoopGetCurrent();
	CFArrayRef allModes = CFRunLoopCopyAllModes(runLoop);
	
	while (!dismissed) {
		for (NSString *mode in (__bridge NSArray *)allModes) {
			CFRunLoopRunInMode((CFStringRef)CFBridgingRetain(mode), 0.001, false);
		}
	}
	
	CFRelease(allModes);

	NSSetUncaughtExceptionHandler(NULL);
	signal(SIGABRT, SIG_DFL);
	signal(SIGILL, SIG_DFL);
	signal(SIGSEGV, SIG_DFL);
	signal(SIGFPE, SIG_DFL);
	signal(SIGBUS, SIG_DFL);
	signal(SIGPIPE, SIG_DFL);
	
	if ([exception.name isEqual:UncaughtExceptionHandlerSignalExceptionName]) {
		kill(getpid(), [exception.userInfo[UncaughtExceptionHandlerSignalKey] intValue]);
	}
	else {
		[exception raise];
	}
}

@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

void HandleException(NSException *exception) {
	int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
	if (exceptionCount > UncaughtExceptionMaximum) return;
	
	NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary:(id)exception.userInfo];
    NSArray *callStack = [UncaughtExceptionHandler backtrace];
    if (callStack) {
        userInfo[UncaughtExceptionHandlerAddressesKey] = callStack;
    }

    NSException *caughtException = [NSException exceptionWithName:[exception name] reason:[exception reason] userInfo:userInfo];
	[RF_AUTORELEASE([[UncaughtExceptionHandler alloc] init]) performSelectorOnMainThread:@selector(handleException:) withObject:caughtException waitUntilDone:YES];
}

void SignalHandler(int signal) {
	int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
	if (exceptionCount > UncaughtExceptionMaximum) return;
	
    NSMutableDictionary *userInfo = [@{ UncaughtExceptionHandlerSignalKey : @(signal) } mutableCopy];
	NSArray *callStack = [UncaughtExceptionHandler backtrace];
    if (callStack) {
        userInfo[UncaughtExceptionHandlerAddressesKey] = callStack;
    }

    NSException *caughtException = [NSException exceptionWithName:UncaughtExceptionHandlerSignalExceptionName reason:[NSString stringWithFormat:NSLocalizedString(@"Signal %d was raised.", nil), signal] userInfo:userInfo];
	[RF_AUTORELEASE([[UncaughtExceptionHandler alloc] init]) performSelectorOnMainThread:@selector(handleException:) withObject:caughtException waitUntilDone:YES];
}

#pragma clang diagnostic pop

void InstallUncaughtExceptionHandler(void) {
	NSSetUncaughtExceptionHandler(&HandleException);
	signal(SIGABRT, SignalHandler);
	signal(SIGILL, SignalHandler);
	signal(SIGSEGV, SignalHandler);
	signal(SIGFPE, SignalHandler);
	signal(SIGBUS, SignalHandler);
	signal(SIGPIPE, SignalHandler);
}

