/*!
    RFAlloctionProxy
    RFKit

    Copyright (c) 2012-2014, 2017 BB9z
    https://github.com/RFUI/Core

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFPerformance.h"

/**
 With this tool, you can check whether an object has released correctly or not through the log.
 
 If you subclass the object, you can use RFAlloctionLog directly. RFAlloctionProxyView and RFAlloctionProxyButton just make it convenient to use, as you could just change the class name instead of have to write an new class.
 */

#if TARGET_OS_MAC
@interface RFAlloctionProxyView : NSView
#else
@interface RFAlloctionProxyView : UIView
#endif
@end

#if TARGET_OS_MAC
@interface RFAlloctionProxyButton : NSButton
#else
@interface RFAlloctionProxyButton : UIButton
#endif
@end
