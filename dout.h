/*!
	Debug output kit(dout)
	RFKit

	ver 1.0.1
 */

#ifndef _DOUT_H_
#define _DOUT_H_

/**
	Howto: Set DEBUGOUT use compiler flags
	
	Build Settings -> Other C Flags, use -Dmacro[=defn] to set macro define.
	For example, to disable dout, set -DDEBUGOUT=0
 */
#ifndef DEBUGOUT
#	define DEBUGOUT 1
#endif

//#define DOUT_FALG_TRACE 1

/** DOUT_FALG_TRACE
	This macro used to help location dout print statements.
 */
#ifndef DOUT_FALG_TRACE
#	define DOUT_FALG_TRACE 0
#endif

/** DOUT_TRACE_FORMATTER
	This macro should define as NSString
 */
#ifndef DOUT_TRACE_FORMATTER
#	if DOUT_FALG_TRACE
#		define DOUT_TRACE_FORMATTER [NSString stringWithFormat:@"%@:%d >> ",[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__]
#	else
#		define DOUT_TRACE_FORMATTER @""
#	endif
#endif


/// _dout
#define _dout(...)
#define _douts(...)
#define _douto(...)
#define _dout_bool(...)
#define _dout_float(...)
#define _dout_point(...)
#define _dout_size(...)
#define _dout_rect(...)
#define _doutf(...)
#define _doutwork(...)
#define _douttrace(...)

/// main
#if DEBUGOUT
	#define dout(format,...)		\
		if(DEBUGOUT){NSLog(format,##__VA_ARGS__);}

	#define douto(NSObject)	\
		if(DEBUGOUT){NSLog(@"%@%s = %@", DOUT_TRACE_FORMATTER, #NSObject, NSObject);}

	#define dout_bool(boolVar)	\
		if(DEBUGOUT){NSLog(@"%@%s = %@", DOUT_TRACE_FORMATTER, #boolVar, boolVar?@"YES":@"NO");}

	#define dout_float(floatVar)	\
		if(DEBUGOUT){NSLog(@"%@%s = %f", DOUT_TRACE_FORMATTER, #floatVar, (float)floatVar);}

	#define dout_point(point_struct_with_x_y)	\
		if(DEBUGOUT){NSLog(@"%@%s = {%f, %f}", DOUT_TRACE_FORMATTER, #point_struct_with_x_y, (float)point_struct_with_x_y.x, (float)point_struct_with_x_y.y);}

	#define dout_size(size_struct_with_width_height)	\
		if(DEBUGOUT){NSLog(@"%@%s = {%f, %f}", DOUT_TRACE_FORMATTER, #size_struct_with_width_height, (float)size_struct_with_width_height.width, size_struct_with_width_height.height);}

	#define dout_rect(CGRect)	\
		if(DEBUGOUT){NSLog(@"%@%s = {%f, %f,%f, %f}", DOUT_TRACE_FORMATTER, #CGRect, CGRect.origin.x, CGRect.origin.y, CGRect.size.width, CGRect.size.height);}

	#define douts(NSString)	\
		if(DEBUGOUT){NSLog(@"%@%@", DOUT_TRACE_FORMATTER, NSString);}

	#define doutwork()		\
		if(DEBUGOUT){NSLog(@"%@%s: It Works!", DOUT_TRACE_FORMATTER, __FUNCTION__);}

	#define douttrace()		\
		if(DEBUGOUT){NSLog(@"%@%s @%@", DOUT_TRACE_FORMATTER, __PRETTY_FUNCTION__, [NSThread callStackSymbols]);}

	#define DOUT_START if(DEBUGOUT){
	#define DOUT_END }

	#define DAUTORELEASEPOOL_START	@autoreleasepool{
	#define DAUTORELEASEPOOL_END	}

#else
	#define dout(...)
	#define douts(...)
	#define douto(...)
	#define dout_bool(...)
	#define dout_float(...)
	#define dout_point(...)
	#define dout_size(...)
	#define dout_rect(...)
	#define doutf(...)
	#define doutwork(...)
	#define douttrace(...)

	#define DOUT_START
	#define DOUT_END

	#define DAUTORELEASEPOOL_START
	#define DAUTORELEASEPOOL_END
#endif

#endif
