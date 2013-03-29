/*!
    UITableView extension
    RFKit

    Copyright (c) 2013 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import "RFRuntime.h"

@interface UITableView (RFKit)

/** 
 Deselects all selected rows, with an option to animate the deselection.
 
 @discussion Calling this method does not cause the delegate to receive a `tableView:willSelectRowAtIndexPath:` or `tableView:didSelectRowAtIndexPath: message`, nor will it send `UITableViewSelectionDidChangeNotification` notifications to observers.
 
 Calling this method does not cause any scrolling to the deselected row.
 
 @param animated
    YES if you want to animate the deselection and NO if the change should be immediate.
 
 */
- (void)deselectRows:(BOOL)animated;
@end
