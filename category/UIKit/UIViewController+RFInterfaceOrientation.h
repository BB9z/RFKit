/*!
 UIInterfaceOrientation extension for UIViewController
 RFKit
 
 Copyright (c) 2012-2013, 2015, 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import <UIKit/UIKit.h>

#ifndef RFUIInterfaceOrientationSupport_H
#define RFUIInterfaceOrientationSupport_H

// For iOS 9 SDK below
#ifndef __IPHONE_9_0
#define UIInterfaceOrientationMask NSUInteger
#endif

// Tools
#define _rf_UIInterfaceOrientationSupport_ShouldAutorotate_ \
- (BOOL)shouldAutorotate {\
    return YES;\
}

#define _rf_UIInterfaceOrientationSupport_SupportedInterfaceOrientations_(iPhoneOption, iPadOption) \
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {\
    if ([UIDevice currentDevice].isPad) {\
        return iPadOption;\
    }\
    else {\
        return iPhoneOption;\
    }\
}

#define _rf_UIInterfaceOrientationSupport_SupportedInterfaceOrientations_Both(Option) \
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {\
    return Option;\
}


#pragma mark - Rule

// iPhone Only Portrait, no upside down
// iPad All
#define RFUIInterfaceOrientationSupportDefault \
    _rf_UIInterfaceOrientationSupport_ShouldAutorotate_\
    _rf_UIInterfaceOrientationSupport_SupportedInterfaceOrientations_(UIInterfaceOrientationMaskPortrait, UIInterfaceOrientationMaskAll)\
    \
    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {\
        if ([UIDevice currentDevice].isPad) {\
            return YES;\
        }\
        else {\
            return (toInterfaceOrientation == UIInterfaceOrientationPortrait);\
        }\
    }

// iPhone Only Portrait, no upside down
// iPad Portrait + PortraitUpsideDown
#define RFUIInterfaceOrientationSupportPortrait \
    _rf_UIInterfaceOrientationSupport_ShouldAutorotate_\
    _rf_UIInterfaceOrientationSupport_SupportedInterfaceOrientations_(UIInterfaceOrientationMaskPortrait, (UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskPortraitUpsideDown))\
    \
    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {\
        if ([UIDevice currentDevice].isPad) {\
            return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);\
        }\
        else {\
            return (UIInterfaceOrientationPortrait == toInterfaceOrientation);\
        }\
    }

// iPhone & iPad Only Landscape (Left+Right)
#define RFUIInterfaceOrientationSupportLandscape \
    _rf_UIInterfaceOrientationSupport_ShouldAutorotate_\
    _rf_UIInterfaceOrientationSupport_SupportedInterfaceOrientations_Both(UIInterfaceOrientationMaskLandscape)\
    \
    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {\
        return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);\
    }

// All, except PortraitUpsideDown on iPhone
#define RFUIInterfaceOrientationSupportAll \
    _rf_UIInterfaceOrientationSupport_ShouldAutorotate_\
    _rf_UIInterfaceOrientationSupport_SupportedInterfaceOrientations_(UIInterfaceOrientationMaskAllButUpsideDown, UIInterfaceOrientationMaskAll)\
    \
    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {\
        if ([UIDevice currentDevice].isPad) {\
            return YES;\
        }\
        else {\
            return (UIInterfaceOrientationPortraitUpsideDown != toInterfaceOrientation);\
        }\
    }

#pragma mark -

// Let navigation controller rotate according to current view controller
// May not fallback to topViewController on iOS 5.
#define RFUIInterfaceOrientationSupportNavigation \
    - (BOOL)shouldAutorotate {\
        return [self.topViewController shouldAutorotate];\
    }\
    \
    - (UIInterfaceOrientationMask)supportedInterfaceOrientations {\
        return [self.topViewController supportedInterfaceOrientations];\
    }


#pragma mark -

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-id-macro"

// For disable
#define _RFUIInterfaceOrientationSupportDefault
#define _RFUIInterfaceOrientationSupportPortrait
#define _RFUIInterfaceOrientationSupportLandscape
#define _RFUIInterfaceOrientationSupportAll

#define _RFUIInterfaceOrientationSupportNavigation

#pragma clang diagnostic pop

#endif
