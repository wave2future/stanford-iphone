//
//  PersonDetailViewController.m
//  Presence
//
//  Created by Daniel Williams on 30/11/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailViewController.h"


@implementation PersonDetailViewController

@synthesize nameLabel;
@synthesize status;
@synthesize pic;
@synthesize person;

-(void)viewWillAppear:(BOOL)animated {
	nameLabel.text = [person objectForKey:@"name"];
	status.text = [person objectForKey:@"status"];
	pic.image = [UIImage imageNamed:[person objectForKey:@"image"]];
	[super viewWillAppear:animated];
}

- (void)viewDidUnload { 
    self.nameLabel = nil; 
	self.status = nil;
	self.pic = nil;
	self.person = nil;
    [super viewDidUnload]; 
} 

- (void)dealloc { 
    [nameLabel release]; 
	[status release];
	[pic release];
	[person release];
    [super dealloc]; 
} 


@end
