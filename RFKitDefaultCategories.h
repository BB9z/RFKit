/*!
 RFKit
 This file define which extension category will included by default.
 
 Copyright (c) 2012-2015, 2017-2018 BB9z
 https://github.com/bb9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */

#import "NSArray+RFKit.h"
#import "NSBundle+RFKit.h"
//#import "NSDate+RFKit.h"
//#import "NSDateFormatter+RFKit.h"
#import "NSDictionary+RFKit.h"
#import "NSError+RFKit.h"
//#import "NSFileManager+RFKit.h"
//#import "NSJSONSerialization+RFKit.h"
//#import "NSNumberFormatter+RFKit.h"
#import "NSObject+RFKit.h"
#import "NSString+RFKit.h"
//#import "NSURL+RFKit.h"

#if TARGET_OS_IOS
//#import "NSLayoutConstraint+RFKit.h"
//#import "UIAlertView+RFKit.h"
#import "UIButton+RFKit.h"
#import "UIColor+RFKit.h"
#import "UIDevice+RFKit.h"
#import "UIImage+RFKit.h"
#import "UINavigationController+RFKit.h"
//#import "UIPickerView+RFKit.h"
#import "UIResponder+RFKit.h"
//#import "UIScrollView+RFScrolling.h"
//#import "UISearchBar+RFKit.h"
#import "UIStoryboard+RFKit.h"
#import "UITableView+RFKit.h"
//#import "UITextField+RFKit.h"
#import "UIView+RFAnimate.h"
#import "UIView+RFKit.h"
#import "UIViewController+RFKit.h"
//#import "UIViewController+RFInterfaceOrientation.h"
//#import "UIWebView+RFKit.h"

#elif TARGET_OS_TV
#import "UIButton+RFKit.h"
#import "UIColor+RFKit.h"
#import "UIDevice+RFKit.h"
#import "UIImage+RFKit.h"
#import "UINavigationController+RFKit.h"
#import "UIResponder+RFKit.h"
#import "UIStoryboard+RFKit.h"
#import "UITableView+RFKit.h"
#import "UIView+RFAnimate.h"
#import "UIView+RFKit.h"
#import "UIViewController+RFKit.h"
#elif TARGET_OS_WATCH
#import "UIColor+RFKit.h"
#import "UIImage+RFKit.h"
#endif
