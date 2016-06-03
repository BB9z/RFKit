/*!
	Debug output kit(dout)
	RFKit

	ver 2.9
 
    Copyright (c) 2012-2016 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#ifndef DOUT_H
#define DOUT_H 2.9

#import "RFRuntime.h"

#pragma mark - Config

// If DOUT_ASSERT_AT_ERROR is enabled, DOUT_TREAT_ERROR_AS_EXCEPTION will not available.
#ifndef DOUT_ASSERT_AT_ERROR
#   define DOUT_ASSERT_AT_ERROR 0
#endif
#ifndef DOUT_ASSERT_AT_WANRNING
#   define DOUT_ASSERT_AT_WANRNING 0
#endif

#ifndef DOUT_TREAT_ERROR_AS_EXCEPTION
#   define DOUT_TREAT_ERROR_AS_EXCEPTION 0
#endif
#ifndef DOUT_TREAT_WANRNING_AS_EXCEPTION
#   define DOUT_TREAT_WANRNING_AS_EXCEPTION 0
#endif

//#define DOUT_FALG_TRACE 1

/** DOUT_FALG_TRACE
	This macro used to help location dout print statements.
 */
#ifndef DOUT_FALG_TRACE
#	define DOUT_FALG_TRACE 0
#endif

/** DOUT_TRACE_FORMATTER
	This macro should be defined as NSString
 */
#ifndef DOUT_TRACE_FORMATTER
#	if DOUT_FALG_TRACE
#		define DOUT_TRACE_FORMATTER [NSString stringWithFormat:@"[%@:%d] ", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__]
#	else
#		define DOUT_TRACE_FORMATTER @""
#	endif
#endif

#pragma mark - Variables log helper
#define DoutLog(...)\
    DoutLogString(([DOUT_TRACE_FORMATTER stringByAppendingFormat: __VA_ARGS__]))


/// main
#define _dout_level(LV, ...)\
    {if(RFDebugLevel >= LV) DoutLog(__VA_ARGS__);}

#define dout(...)       _dout_level(RFDebugLevelError, __VA_ARGS__)

#define douts(...)      dout((__VA_ARGS__))
#define douto(...)      dout(@"%@ = <%@> %@", @(#__VA_ARGS__), [(NSObject *)(__VA_ARGS__) class], (__VA_ARGS__))
#define doutp(...)      dout(@"%@ -> %p",   @(#__VA_ARGS__), (__VA_ARGS__))
#define doutv(...)      dout(@"%@ = %@",    @(#__VA_ARGS__), [((UIView *)(__VA_ARGS__)) performSelector:@selector(recursiveDescription)])

#define dout_bool(...)  dout(@"%@ = %@",    @(#__VA_ARGS__), ((BOOL)(__VA_ARGS__))? @"YES" : @"NO")
#define dout_int(...)   dout(@"%@ = %ld",   @(#__VA_ARGS__), ((long)(__VA_ARGS__)))
#define dout_hex(...)   dout(@"%@ = %#.8x", @(#__VA_ARGS__), ((int)(__VA_ARGS__)))
#define dout_float(...) dout(@"%@ = %f",    @(#__VA_ARGS__), ((float)(__VA_ARGS__)))

#define dout_point(...) dout(@"%@ = %@",    @(#__VA_ARGS__), NSStringFromCGPoint((CGPoint)(__VA_ARGS__)))
#define dout_size(...)  dout(@"%@ = %@",    @(#__VA_ARGS__), NSStringFromCGSize((CGSize)(__VA_ARGS__)))
#define dout_rect(...)  dout(@"%@ = %@",    @(#__VA_ARGS__), NSStringFromCGRect((CGRect)(__VA_ARGS__)))
#define dout_insets(...)  dout(@"%@ = %@",  @(#__VA_ARGS__), NSStringFromUIEdgeInsets((UIEdgeInsets)(__VA_ARGS__)))

#define doutwork()      dout(@"%@: It Works!", @(__FUNCTION__))
#define douttrace()     dout(@"%@ @%@", @(__PRETTY_FUNCTION__), [NSThread callStackSymbols])
#define doutlastmethod()  dout(@"%@ @%@", @(__PRETTY_FUNCTION__), ([[NSThread callStackSymbols] rf_objectAtIndex:1]))
#define doutline()      dout(@"%@ line:%d", @(__PRETTY_FUNCTION__), __LINE__)

#pragma mark Log helper

#ifndef dout_debug
    #define dout_debug(...) _dout_level(RFDebugLevelVerbose, @"<Debug> %@", [NSString stringWithFormat:__VA_ARGS__])
#endif

#ifndef dout_info
    #define dout_info(...) _dout_level(RFDebugLevelInfo, @"<Info> %@", [NSString stringWithFormat:__VA_ARGS__])
#endif

#ifndef dout_warning
    #if DOUT_ASSERT_AT_WANRNING
        #define dout_warning(...)\
            {if (RFDebugLevel >= RFDebugLevelWarning) NSAssert(false, __VA_ARGS__);}

    #elif DOUT_TREAT_WANRNING_AS_EXCEPTION
        #define dout_warning(...)\
            {if (RFDebugLevel >= RFDebugLevelWarning) @throw [NSException exceptionWithName:@"DOUT Warning" reason:[NSString stringWithFormat:__VA_ARGS__] userInfo:nil];}

    #else
        #define dout_warning(...)\
            _dout_level(RFDebugLevelWarning, @"<Warning> %@", [NSString stringWithFormat:__VA_ARGS__])
    #endif
#endif

#ifndef dout_error
    #if DOUT_ASSERT_AT_ERROR
        #define dout_error(...)\
            {if (RFDebugLevel >= RFDebugLevelError) NSAssert(false, __VA_ARGS__);}

    #elif DOUT_TREAT_ERROR_AS_EXCEPTION
        #define dout_error(...)\
            {if (RFDebugLevel >= RFDebugLevelError) @throw [NSException exceptionWithName:@"DOUT Error" reason:[NSString stringWithFormat:__VA_ARGS__] userInfo:nil];}

    #else
        #define dout_error(...)\
            _dout_level(RFDebugLevelError, @"<Error> %@", [NSString stringWithFormat:__VA_ARGS__]);
    #endif
#endif


#pragma mark Assert
/*!
    Refrence: http://www.cimgf.com/2010/05/02/my-current-prefix-pch-file
    Thanks to Marcus Zarra.
 */

#ifndef RFALog
#   if RFDEBUG
#       define RFALog(...)\
            [[NSAssertionHandler currentHandler] handleFailureInFunction:(id)[NSString stringWithCString:__PRETTY_FUNCTION__ encoding:NSUTF8StringEncoding] file:(id)[NSString stringWithCString:__FILE__ encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__];
#   else
#       define RFALog(...)\
            dout_error(@"%@ %@", @(__PRETTY_FUNCTION__), [NSString stringWithFormat:__VA_ARGS__])
#   endif
#endif

#ifndef RFAssert
#   define RFAssert(condition, ...)\
        if (!(condition)) {\
            RFALog(__VA_ARGS__)\
        }
#endif

#pragma mark Segment
#if RFDEBUG
    #define DTRYCATCH_START @try {
    #define DTRYCATCH_END \
        } @catch (NSException *exception) { \
            douto(exception) \
            douttrace() \
        } @finally {}

#else
    #define DTRYCATCH_START
    #define DTRYCATCH_END
#endif

#pragma mark - Others
/// Cover input to NSString.
#ifndef s
#   define s(...) @#__VA_ARGS__
#endif

#pragma mark - _dout
/// _dout
#define _dout(...)
#define _douts(...)
#define _douto(...)
#define _doutp(...)
#define _doutv(...)

#define _dout_bool(...)
#define _dout_int(...)
#define _dout_hex(...)
#define _dout_float(...)
#define _dout_point(...)
#define _dout_size(...)
#define _dout_rect(...)
#define _dout_insets(...)

#define _doutwork(...)
#define _douttrace(...)
#define _doutlastmethod(...)
#define _doutline(...)

#define _dout_debug(...)
#define _dout_info(...)
#define _dout_warning(...)
#define _dout_error(...)

void DoutLogString(NSString *string);
NSString * DoutCurrentThreadOrQueueName(void);
void _dout_log_config(void);

#endif
