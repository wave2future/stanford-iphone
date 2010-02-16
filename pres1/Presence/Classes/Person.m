//
//  Person.m
//  Presence
//
//  Created by Daniel Williams on 03/12/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name;
@synthesize status;
@synthesize image;

- (void)dealloc {
	[name release];
	[status release];
	[image release];
	
	[super dealloc];
}

- (id)initWithName:(NSString *)myName status:(NSString *)myStatus image:(NSString *)myImage {
	if(self = [super init]) {
		[self setName:myName];
		[self setStatus:myStatus];
		[self setImage:myImage];
	}
	return self;
}

@end
