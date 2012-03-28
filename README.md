# RFKit
To be a useful library for daily iOS develop.

ARC supported.

## Debug output kit (dout)


## Extension categories
### NSObject
// need update

### NSString
// need update

### UIColor
* Creat UIColor use hex RGB value, ep:

	[UIColor colorWithRGBHex:0xFF0000];
	[UIColor colorWithRGBString:@"0xFF0000" alpha:0.5f];
	
	
### UIImage
// need update

### UIView
// need update

## Performance utilities
* Log raw memory useage info

    [RFKit logMemoryInfo]
    
* Time tracking
	* \- (time_t)addTimePoint:(NSString *)name;
	* \- (float)timeBetween:(NSString *)name1 another:(NSString *)name2;
	
## RFMath
// need update

## Other utilities
* Get device mac address

	[RFKit getMacAddress];

