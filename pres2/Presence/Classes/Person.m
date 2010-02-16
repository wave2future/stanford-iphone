//
//  Person.m
//  Presence
//
//  Created by Daniel Williams on 03/12/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"
#import "TwitterHelper.h";


@implementation Person

@synthesize screen;
@synthesize display;
@synthesize image;
@synthesize tweets;

- (void)dealloc {
	[screen release];
	[display release];
	[image release];
	[tweets release];
	
	[super dealloc];
}

-(id)initWithScreenName:(NSString *)myScreen {
	NSDictionary *user = [TwitterHelper fetchInfoForUsername:myScreen];	
	
	NSURL *url = [NSURL URLWithString:[user objectForKey:@"profile_image_url"]];
	NSData *data = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
	
	NSArray *twits =[TwitterHelper fetchTimelineForUsername:myScreen];
	
	return [self initWithScreen:myScreen display:[user objectForKey:@"name"] tweets:twits image:img];
}

- (id)initWithScreen:(NSString *)myScreen display:(NSString *)myDisplay tweets:(NSArray *)myTweets image:(UIImage *)myImage {
	if(self = [super init]) {
		[self setScreen:myScreen];
		[self setDisplay:myDisplay];
		[self setTweets:myTweets];
		[self setImage:myImage];
	}
	return self;
}

@end
