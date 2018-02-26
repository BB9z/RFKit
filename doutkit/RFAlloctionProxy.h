/*!
    RFAlloctionProxy
    RFKit

    Copyright (c) 2012-2014, 2017-2018 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */
#import "RFPerformance.h"

/**
 With this tool, you can check whether an object has released correctly or not through the log.
 
 If you subclass the object, you can use RFAlloctionLog directly. RFAlloctionProxyView and RFAlloctionProxyButton just make it convenient to use, as you could just change the class name instead of have to write an new class.
 */

#if TARGET_OS_OSX
API_AVAILABLE(macos(10.0))
@interface RFAlloctionProxyView : NSView
#else
API_AVAILABLE(ios(2.0), tvos(9.0))
@interface RFAlloctionProxyView : UIView
#endif
@end

#if TARGET_OS_OSX
API_AVAILABLE(macos(10.0))
@interface RFAlloctionProxyButton : NSButton
#else
API_AVAILABLE(ios(2.0), tvos(9.0))
@interface RFAlloctionProxyButton : UIButton
#endif
@end
