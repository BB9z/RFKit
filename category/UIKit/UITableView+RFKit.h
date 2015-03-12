/*!
    UITableView extension
    RFKit

    Copyright (c) 2013-2015 BB9z
    https://github.com/BB9z/RFKit

    The MIT License (MIT)
    http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

@interface UITableView (RFKit)

/** 
 Deselects all selected rows, with an option to animate the deselection.
 
 @discussion Calling this method does not cause the delegate to receive a `tableView:willSelectRowAtIndexPath:` or `tableView:didSelectRowAtIndexPath: message`, nor will it send `UITableViewSelectionDidChangeNotification` notifications to observers.
 
 Calling this method does not cause any scrolling to the deselected row.
 
 @param animated
    YES if you want to animate the deselection and NO if the change should be immediate.
 */
- (void)deselectRows:(BOOL)animated;

/**
 @abstract Returns a reusable table-view cell object located by its class. The cell´s reuseIdentifier must equal to its class name.
 
 @param cellClass The class of the cell object to be reused.
 
 @return A UITableViewCell object with the associated identifier or nil if no such object exists in the reusable-cell queue.
 */
- (id)dequeueReusableCellWithClass:(Class)cellClass;

/**
 Lays out the tableHeaderView with the size that satisfies the constraints it holds immediately.
 */
- (void)autoLayoutTableHeaderView;

/**
 Lays out the tableFooterView with the size that satisfies the constraints it holds immediately.
 */
- (void)autoLayoutTableFooterView;
@end
