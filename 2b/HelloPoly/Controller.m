#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    NSLog(@"I’m in the decrease method");
	[polygon setNumberOfSides:polygon.numberOfSides-1];
	[self updateInterface];
}

- (IBAction)increase {
    NSLog(@"I’m in the increase method");
	[polygon setNumberOfSides:polygon.numberOfSides+1];
	[self updateInterface];
}

- (void)awakeFromNib { 
	// configure your polygon here 
	NSLog(@"Config..");
	[polygon setMinimumNumberOfSides:3];
	[polygon setMaximumNumberOfSides:12];
	[polygon setNumberOfSides:numberOfSidesLabel.text.integerValue];
	NSLog(polygon.description);
	[polyView setPolygon:polygon];
	
	CGRect frame = CGRectMake(50, 70, 100, 21); 
	UILabel *label = [[UILabel alloc] initWithFrame:frame]; 
	[polyView addSubview:label]; 
	[label setText:@"poop"]; 
	
	[label release];
} 

- (void)updateInterface { 
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
	if(polygon.numberOfSides >= polygon.maximumNumberOfSides) {
		increaseButton.enabled = NO;
	} else {
		increaseButton.enabled = YES;
	}
	
	if(polygon.numberOfSides <= polygon.minimumNumberOfSides) {
		decreaseButton.enabled = NO;
	} else {
		decreaseButton.enabled = YES;
	}
	
	[polyView setNeedsDisplay];
} 


@end
