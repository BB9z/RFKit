#import "RFKit.h"

#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import <mach/mach.h>

// 消除 renderInContext 找不到的警告
#import <QuartzCore/CALayer.h>

@implementation RFKit (private_)

@end


@implementation RFKit
@synthesize timeTable;

static RFKit *sharedInstance = nil;
+ (RFKit *)sharedKit {
	if (sharedInstance == nil) {
		sharedInstance = [[self alloc] init];
	}
	return sharedInstance;
}

- (RFKit *)init {
	self = [super init];
	if (self) {
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] initWithCapacity:20];
		self.timeTable = tmp;
		[tmp release];
		timeBase = clock();
	}
	return self;
}

- (void)dealloc {
	[super dealloc];
	
	self.timeTable = nil;
}

+ (void)rls:(id)first,... {
	va_list ap;
	va_start(ap, first);
	for (id obj=first; obj!=nil; obj = va_arg(ap, id))
		[obj release];
	va_end(ap);
}

- (time_t)addTimePoint:(NSString *)name {
	time_t t = clock();
	NSNumber * tmpTime = [[NSNumber alloc] initWithFloat:(t-timeBase)/(double)CLOCKS_PER_SEC];
	if ([self.timeTable objectForKey:name]) {
		dout(@"Warning: A time point with the same name already existed.");
	}
	[self.timeTable setObject:tmpTime forKey:name];
	[tmpTime release];
	return t;
}

- (float)timeBetween:(NSString *)name1 another:(NSString *)name2{
	float time1 = [(NSNumber *)[self.timeTable objectForKey:name1] floatValue];
	float time2 = [(NSNumber *)[self.timeTable objectForKey:name2] floatValue];
	float time = time1 - time2;
	return ABS(time);
}

+ (NSString *)getMacAddress {
	int                 mgmtInfoBase[6];
	char                *msgBuffer = NULL;
	size_t              length;
	unsigned char       macAddress[6];
	struct if_msghdr    *interfaceMsgStruct;
	struct sockaddr_dl  *socketStruct;
	NSString            *errorFlag = NULL;
	
	// Setup the management Information Base (mib)
	mgmtInfoBase[0] = CTL_NET;        // Request network subsystem
	mgmtInfoBase[1] = AF_ROUTE;       // Routing table info
	mgmtInfoBase[2] = 0;              
	mgmtInfoBase[3] = AF_LINK;        // Request link layer information
	mgmtInfoBase[4] = NET_RT_IFLIST;  // Request all configured interfaces
	
	// With all configured interfaces requested, get handle index
	if ((mgmtInfoBase[5] = if_nametoindex("en0")) == 0) 
		errorFlag = @"if_nametoindex failure";
	else
	{
		// Get the size of the data available (store in len)
		if (sysctl(mgmtInfoBase, 6, NULL, &length, NULL, 0) < 0) 
			errorFlag = @"sysctl mgmtInfoBase failure";
		else
		{
			// Alloc memory based on above call
			if ((msgBuffer = malloc(length)) == NULL)
				errorFlag = @"buffer allocation failure";
			else
			{
				// Get system information, store in buffer
				if (sysctl(mgmtInfoBase, 6, msgBuffer, &length, NULL, 0) < 0)
					errorFlag = @"sysctl msgBuffer failure";
			}
		}
	}
	
	// Befor going any further...
	if (errorFlag != NULL)
	{
		NSLog(@"Error: %@", errorFlag);
		return errorFlag;
	}
	
	// Map msgbuffer to interface message structure
	interfaceMsgStruct = (struct if_msghdr *) msgBuffer;
	
	// Map to link-level socket structure
	socketStruct = (struct sockaddr_dl *) (interfaceMsgStruct + 1);
	
	// Copy link layer address data in socket structure to an array
	memcpy(&macAddress, socketStruct->sdl_data + socketStruct->sdl_nlen, 6);
	
	// Read from char array into a string object, into traditional Mac address format
	NSString *macAddressString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", 
								  macAddress[0], macAddress[1], macAddress[2], 
								  macAddress[3], macAddress[4], macAddress[5]];
	dout(@"Mac Address: %@", macAddressString);
	
	// Release the buffer memory
	free(msgBuffer);
	
	return macAddressString;
}

+ (void)logMemoryInfo {
    vm_statistics_data_t vmStats;
    
	mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
	
    if (kernReturn == KERN_SUCCESS){
        NSLog(@"free: %u\nactive: %u\ninactive: %u\nwire: %u\nzero fill: %u\nreactivations: %u\npageins: %u\npageouts: %u\nfaults: %u\ncow_faults: %u\nlookups: %u\nhits: %u",
			  vmStats.free_count * vm_page_size,
			  vmStats.active_count * vm_page_size,
			  vmStats.inactive_count * vm_page_size,
			  vmStats.wire_count * vm_page_size,
			  vmStats.zero_fill_count * vm_page_size,
			  vmStats.reactivations * vm_page_size,
			  vmStats.pageins * vm_page_size,
			  vmStats.pageouts * vm_page_size,
			  vmStats.faults,
			  vmStats.cow_faults,
			  vmStats.lookups,
			  vmStats.hits
			  );
    }
}
@end


#pragma mark -
#pragma mark NSObject 扩展
@implementation NSObject (extension)

- (void)defaultFill:(id)test with:(id)value {
	if (test == nil || test == [NSNull null]) {
		douts(@"test NULL in defaultFill")
		test = value;
	}
}

- (id)get:(id)test defaults:(id)value {
	if (test == nil || test == [NSNull null]) {
		return value;
	}
	else {
		return test;
	}
}

@end


#pragma mark -
#pragma mark NSString 扩展
@implementation NSString (extension)

- (NSString *)reverseString {
	NSMutableString *reversedStr;
	int len = [self length];
	
	// Auto released string
	reversedStr = [NSMutableString stringWithCapacity:len];     
	
	// Probably woefully inefficient...
	while (len > 0)
		[reversedStr appendString: [NSString stringWithFormat:@"%C", [self characterAtIndex:--len]]];   
	
	return reversedStr;
}

- (NSString *)stringTrimToWidthLength:(CGFloat)length WithFont:(UIFont *)font {
	NSString * tmp = self;
	CGFloat ctLength;
	NSUInteger charNumToRemove;
	CGFloat aLetterWidthSafe = [@"汉" sizeWithFont:font].width*1.5;
	bool trimed = false;
	
	while ((ctLength = [tmp sizeWithFont:font].width) > length) {
		charNumToRemove = (ctLength-length)/aLetterWidthSafe;
		if (charNumToRemove == 0) {
			charNumToRemove = 1;
		}
		tmp = [tmp substringToIndex:([tmp length] - charNumToRemove)];
		trimed = true;
	}
	return trimed ? [NSString stringWithFormat:@"%@...", tmp] : [[self copy] autorelease];
}



@end


#pragma mark -
#pragma mark NSDictionary 扩展
@implementation NSDictionary (extension)

- (id)objectForKey:(id)aKey defaultMarker:(id)anObject {
	return [super get:[self objectForKey:aKey] defaults:anObject];
}

@end


#pragma mark -
#pragma mark NSDateFormatter 扩展
@implementation NSDateFormatter (extension)

+ (NSDateFormatter *)GMTFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
		[share setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	}
	return [[share copy] autorelease];
}

+ (NSDateFormatter *)currentLocaleFormatter {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm':'ss'"];
	}
	return [[share copy] autorelease];
}

+ (NSDateFormatter *)currentLocaleFormatterOnlyDate {
	static NSDateFormatter * share;
	if (!share) {
		share = [[NSDateFormatter alloc] init];
		[share setLocale:[NSLocale currentLocale]];
		[share setDateFormat:@"yyyy'-'MM'-'dd'"];
	}
	return [[share copy] autorelease];
}

@end


#pragma mark -
#pragma mark UIView 扩展
@implementation UIView (extension)
- (UIImage *)renderToImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [[UIScreen mainScreen] scale]);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark 视图位置／尺寸

-(void)exhangeWidthHight{
	CGRect tmp = self.bounds;
	self.frame = CGRectMake(tmp.origin.x, tmp.origin.y, tmp.size.height, tmp.size.width);
}

- (void)moveX:(CGFloat)x Y:(CGFloat)y {
	CGPoint tmp = self.center;
	tmp.x += x;
	tmp.y += y;
	self.center = tmp;
}

- (void)moveToX:(CGFloat)x Y:(CGFloat)y {
	CGRect tmp = self.frame;
	if (x != CGFLOAT_MAX) tmp.origin.x = x;
	if (y != CGFLOAT_MAX) tmp.origin.y = y;
	self.frame = tmp;
}

- (void)resizeWidth:(CGFloat)width height:(CGFloat)height {
	CGRect tmp = self.frame;
	if (width  != CGFLOAT_MAX) tmp.size.width  = width;
	if (height != CGFLOAT_MAX) tmp.size.height = height;
	self.frame = tmp;
}

#pragma mark 视图层次管理

- (void)removeAllSubviews {
	for (UIView * subview in self.subviews) {
		[subview removeFromSuperview];
	}
}

-(int)getSubviewIndex{
	return [self.superview.subviews indexOfObject:self];
}

-(void)bringToFront{
	[self.superview bringSubviewToFront:self];
}

-(void)sentToBack{
	[self.superview sendSubviewToBack:self];
}

-(void)bringOneLevelUp{
	NSUInteger CurrentIndex = [self getSubviewIndex];
	[self.superview exchangeSubviewAtIndex:CurrentIndex withSubviewAtIndex:CurrentIndex+1];
}

-(void)sendOneLevelDown{
	int currentIndex = [self getSubviewIndex];
	[self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
}

-(BOOL)isInFront{
	return ([self.superview.subviews lastObject]==self);
}

-(BOOL)isAtBack{
	return ([self.superview.subviews objectAtIndex:0]==self);
}

-(void)exchangeDepthsWithView:(UIView*)swapView{
	[self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]];
}
@end


#pragma mark -
#pragma mark UIViewController 扩展
@implementation UIViewController (extension)

- (void)setNavTitle:(NSString *)title back:(NSString *)backTitle{
	self.title = title;
	UIBarButtonItem * tmpBack = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:nil];
	self.navigationItem.backBarButtonItem = tmpBack;
	[tmpBack release];
}

@end


#pragma mark -
#pragma mark NSFileManager 扩展
@implementation NSFileManager (extension)
- (NSArray *)subDirectoryOfDirectoryAtPath:(NSString *)path error:(NSError **)error{
	NSMutableArray * sub = [NSMutableArray arrayWithArray:[self contentsOfDirectoryAtPath:path error:error]];
	douto(sub)
	
	BOOL isDir = false;
	NSString * tmpPath = nil;
	for (int i = [sub count]-1;i>=0;i--) {
		tmpPath = [path stringByAppendingPathComponent:[sub objectAtIndex:i]];
		
		if([self fileExistsAtPath:tmpPath isDirectory:&isDir] && isDir){
			[sub replaceObjectAtIndex:i withObject:tmpPath];
		}
		else{
			[sub removeObjectAtIndex:i];
		}
		
	}
	douto(sub)
	return [NSArray arrayWithArray:sub];
}
@end


#pragma mark -
#pragma mark NSFileManager 扩展
@implementation NSBundle (extension)
+ (NSString *)mainBundlePathForCaches {
	static NSString * path =nil;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/"]];
	}
	return path;
}

+ (NSString *)mainBundlePathForPreferences {
	static NSString * path =nil;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/"]];
	}
	return path;
}

+ (NSString *)mainBundlePathForDocuments {
	static NSString * path;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/"]];
	}
	return path;
}

+ (NSString *)mainBundlePathForTemp {
	static NSString * path =nil;
	if (!path) {
		path = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"/tmp/"]];
	}
	return path;
}

@end

#pragma mark -
#pragma mark UIImage 扩展
@implementation UIImage (extension)
+ (UIImage *)resourceName:(NSString *)PNGFileName{
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:PNGFileName ofType:@"png"]];
}

+ (UIImage *)resourceName:(NSString *)fileName ofType:(NSString *)type {
	return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
}

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
	UIImage *sourceImage = self;
	UIImage *newImage = nil;        
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
	
	if (CGSizeEqualToSize(imageSize, targetSize) == NO) 
	{
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        if (widthFactor > heightFactor) 
			scaleFactor = widthFactor; // scale to fit height
        else
			scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
		
        // center the image
        if (widthFactor > heightFactor)
		{
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
		}
        else 
			if (widthFactor < heightFactor)
			{
				thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
			}
	}       
	
	UIGraphicsBeginImageContext(targetSize); // this will crop
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	if(newImage == nil) 
        NSLog(@"could not scale image");
	
	//pop the context to get back to the default
	UIGraphicsEndImageContext();
	return newImage;
}

- (UIImage *)imageAspectFillSize:(CGSize)targetSize{
	if (CGSizeEqualToSize(self.size, targetSize)) {
		return [[self copy] autorelease];
	}
	
	CGFloat xSource = self.size.width;
	CGFloat ySource = self.size.height;
	CGFloat xTarget = targetSize.width;
	CGFloat yTarget = targetSize.height;
	CGRect tmpImageRect = CGRectMake(0, 0, xSource, ySource);
	CGFloat factor;
	
	if (xSource/ySource > xTarget/yTarget) {
		// 图像按高适配
		factor = yTarget/ySource;
		tmpImageRect.size.width = xSource*factor;
		tmpImageRect.size.height = yTarget;
		tmpImageRect.origin.x = (xTarget -tmpImageRect.size.width)/2;
	}
	else {
		// 图像按宽度适配
		factor = xTarget/xSource;
		tmpImageRect.size.height = ySource*factor;
		tmpImageRect.size.width = xTarget;
		tmpImageRect.origin.y = (yTarget - tmpImageRect.size.height)/2;
	}
	
	UIGraphicsBeginImageContext(targetSize); // this will crop
	[self drawInRect:tmpImageRect];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	if (!newImage) {
		douts(@"Resize Image Faile");
	}
	UIGraphicsEndImageContext();
	return newImage;
}
@end


