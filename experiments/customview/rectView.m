#import "rectView.h"

@implementation rectView

- (void)drawRect:(CGRect)rect { 
	CGRect bounds = [self bounds]; 
	[[UIColor grayColor] set]; 
	UIRectFill (bounds); 
	CGRect square = CGRectMake (10, 10, 50, 100); 
	[[UIColor redColor] set]; 
	UIRectFill (square); 
	[[UIColor blackColor] set]; 
	UIRectFrame (square); 
}

@end
