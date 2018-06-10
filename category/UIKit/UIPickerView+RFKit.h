/*!
 UIPickerView extension
 RFKit
 
 Copyright (c) 2018 BB9z
 https://github.com/BB9z/RFKit
 
 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFFoundation.h"
#import <UIKit/UIKit.h>

@interface UIPickerView (RFKit)

/**
 Safely selects a row in a specified component of the picker view.
 
 If any index is not in the legal range, this method do nothing.
 
 @param row A zero-indexed number identifying a row of component.
 
 @param component A zero-indexed number identifying a component of the picker view.
 
 @param animated `YES` to animate the selection by spinning the wheel (component) to the new value; if you specify `NO`, the new selection is shown immediately.
 */
- (void)rf_selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated API_AVAILABLE(ios(2.0));

@end
