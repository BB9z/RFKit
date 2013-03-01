/*!
    RFARC
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#ifndef _RFKit_RFARC_h_
#define _RFKit_RFARC_h_

#pragma mark -
#pragma mark ARC Compatible Macro

#if __has_feature(objc_arc)
    #define RF_AUTORELEASE(exp)	exp
    #define RF_RELEASE(exp)		exp
    #define RF_RETAIN(exp)		exp
    #define RF_DEALLOC(exp)		exp

    #define RF_AUTORELEASE_OBJ(obj)
    #define RF_RELEASE_OBJ(obj)
    #define RF_RETAIN_OBJ(obj)
    #define RF_DEALLOC_OBJ(obj)
#else
    #define RF_AUTORELEASE(exp)	[exp autorelease]
    #define RF_RELEASE(exp)		[exp release]
    #define RF_RETAIN(exp)		[exp retain]
    #define RF_DEALLOC(exp)		[exp dealloc]

    #define RF_AUTORELEASE_OBJ(obj)	[obj autorelease];
    #define RF_RELEASE_OBJ(obj)		[obj release];
    #define RF_RETAIN_OBJ(obj)		[obj retain];
    #define RF_DEALLOC_OBJ(obj)		[obj dealloc];
#endif

#ifndef RF_STRONG
    #if __has_feature(objc_arc)
        #define RF_STRONG strong
    #else
        #define RF_STRONG retain
    #endif
#endif

#ifndef RF_WEAK
    #if __has_feature(objc_arc_weak)
        #define RF_WEAK weak
    #elif __has_feature(objc_arc)
        #define RF_WEAK unsafe_unretained
    #else
        #define RF_WEAK assign
    #endif
#endif

#if !__has_feature(objc_arc)
    #define RF_IF_NO_ARC 
    #define RF_IF_NO_ARC_END
#else 
    #define RF_IF_NO_ARC	 if(0){
    #define RF_IF_NO_ARC_END }
#endif

#pragma mark - GCD

#ifndef RF_dispatch_retain
    #if OS_OBJECT_USE_OBJC
        #define RF_dispatch_retain(expr)
    #else
        #define RF_dispatch_retain(expr) dispatch_retain(expr)
    #endif
#endif

#ifndef RF_dispatch_release
    #if OS_OBJECT_USE_OBJC
        #define RF_dispatch_release(expr)
    #else
        #define RF_dispatch_release(expr) dispatch_release(expr)
    #endif
#endif

#endif
