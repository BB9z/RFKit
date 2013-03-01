/*!
    RFRuntime
    RFKit

    Copyright (c) 2012-2013 BB9z
    https://github.com/bb9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#pragma mark - Macro options
// If DEBUG is true and NDEBUG is not defined, define RFDEBUG 1, else 0.
#ifndef RFDEBUG
#   if DEBUG && !defined(NDEBUG)
#       define RFDEBUG 1
#   else
#       define RFDEBUG 0
#   endif
#endif

// This macro only change dout.h behave right now.
// See dout.h for details.
#ifndef RFDebugLevel
#   if RFDEBUG
#       define RFDebugLevel 2
#   else
#       define RFDebugLevel 1
#   endif
#endif

#pragma mark -
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "RFARC.h"

#pragma mark - ObjC Ext
/*!
    Ref from EXTKeyPathCoding.h (extobjc)
    https://github.com/jspahrsummers/libextobjc

    Copyright (c) 2012 - 2013 Justin Spahr-Summers

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/** Keypath helper support auto complete and compile-time verification.

 eg:
 
 UIViewController *vc = nil;
 NSLog(@"%@", @keypath(vc.view, frame.origin));     // Will log "frame.origin"
 */
#ifndef keypath
    #define keypath(OBJ, PATH)\
        (( (void)(NO && ((void)OBJ.PATH, NO)), # PATH ))
#endif
