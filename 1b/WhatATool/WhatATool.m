#import <Foundation/Foundation.h>

void PrintPathInfo() { 
	NSString *path = [@"~" stringByExpandingTildeInPath];
    NSLog(@"My home folder is at '%@'", path);
	NSArray *pathComponents = [path pathComponents];

	for(NSString *component in pathComponents) {
		NSLog(component);
	}

} 

void PrintProcessInfo() { 
	NSString *processName = [[NSProcessInfo processInfo] processName];
	int processId = [[NSProcessInfo processInfo] processIdentifier];
    NSLog(@"Process Name: '%@' Process ID: '%d''", processName, processId);
}

void PrintBookmarkInfo() {
	NSDictionary *bookmarks = [NSDictionary dictionaryWithObjectsAndKeys:[NSURL URLWithString:@"http://www.stanford.edu"], @"Stanford University",
								[NSURL URLWithString:@"http://www.apple.com"], @"Apple", 
								[NSURL URLWithString:@"http://cs193p.stanford.edu"], @"CS193P", 
								[NSURL URLWithString:@"http://itunes.stanford.edu"], @"Stanford on iTunes U", 
								[NSURL URLWithString:@"http://stanfordshop.com"], @"Stanford Mall",  nil];
	
	for(NSString *bookmark in bookmarks) {
		NSRange prefixRange = [bookmark rangeOfString:@"Stanford" options:(NSAnchoredSearch)];
		if(prefixRange.location != NSNotFound) {
			NSString *url = [bookmarks objectForKey:bookmark];
			NSLog(@"Key: '%@' URL: '%@'", bookmark, url);
		}
	}
	
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();           // Section 1 
	PrintProcessInfo();        // Section 2 
	PrintBookmarkInfo();       // Section 3 
//	PrintIntrospectionInfo();  // Section 4 
	
	
    [pool drain];
    return 0;
}
