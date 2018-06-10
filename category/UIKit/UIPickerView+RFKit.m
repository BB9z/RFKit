
#import "UIPickerView+RFKit.h"

@implementation UIPickerView (RFKit)

- (void)rf_selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated {
    if (component < 0 || component >= self.numberOfComponents) return;
    if (row <0 || row >= [self numberOfRowsInComponent:component]) return;
    [self selectRow:row inComponent:component animated:animated];
}

@end
