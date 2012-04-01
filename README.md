# RFKit
To be a useful library for daily iOS develop.

ARC supported.

// Sorry for my poor English :-(

## Debug output kit (dout)
### Macros switches
* DEBUGOUT
	
	This macro used to controll dout`s atctive.
	defaule 1
	 
	
* DOUT_FALG_TRACE

	This macro used to help location dout print statements.
	defaule 0
	
* DOUT_TRACE_FORMATTER

	If DOUT_FALG_TRACE is on, DOUT_TRACE_FORMATTER content will add to each print front.
	This macro should define as NSString.

### dout functions
`dout(format,…)`

`douto()` - NSObject, `dout_bool()`, `dout_float()`, `dout_point()`, `dout_size()`, `dout_rect()`, `douts()` - NSString

`doutwork()`

`douttrace()` - print callStackSymbols

### dout statement block
* DOUT_START, DOUT_END
* DAUTORELEASEPOOL_START, DAUTORELEASEPOOL_END


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

