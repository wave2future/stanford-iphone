//
//  PolygonShape.m
//  WhatATool
//
//  Created by Daniel Williams on 19/05/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void)dealloc {
	NSLog(@"deallocing");
	[super dealloc];
}
	
- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if(self = [super init]) {
		[self setMinimumNumberOfSides:min];
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
	}
	return self;
}

- (void)setNumberOfSides:(int)value { 
	if(value < minimumNumberOfSides)
	{
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", value, minimumNumberOfSides);
	} else if(value > maximumNumberOfSides) {
		NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", value, maximumNumberOfSides);
	} else {
		numberOfSides = value;
	}
} 

- (void)setMinimumNumberOfSides:(int)value { 
	if(value > 2) {
		minimumNumberOfSides = value;
	} else {
		NSLog(@"Invalid minimumNumberOfSides: %d is less than minimum of 3", value);
	}
} 

- (void)setMaximumNumberOfSides:(int)value {
	if(value <= 12) {
		maximumNumberOfSides = value;
	} else {
		NSLog(@"Invalid maximumNumberOfSides: %d is greater than maximum of 12", value);
	}
}

- (float)angleInDegrees {
	return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleinRadians {
	return (M_PI * (numberOfSides - 2) / numberOfSides);
}

- (NSString *)name {
	NSDictionary *names = [NSDictionary dictionaryWithObjectsAndKeys:@"Triangle", [NSNumber numberWithInt:3],
						@"Square", [NSNumber numberWithInt:4], 
						@"Pentagon", [NSNumber numberWithInt:5],
						@"Hexagon", [NSNumber numberWithInt:6],
						@"Heptagon", [NSNumber numberWithInt:7],
						@"Octagon", [NSNumber numberWithInt:8],
						@"Nonagon", [NSNumber numberWithInt:9],
						@"Decagon", [NSNumber numberWithInt:10],
						@"Hendecagon", [NSNumber numberWithInt:11],
						@"Dodecagon", [NSNumber numberWithInt:12], nil];
	return [names objectForKey:[NSNumber numberWithInt:[self numberOfSides]]];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", [self numberOfSides], [self name], [self angleInDegrees], [self angleinRadians]];
}

@end
