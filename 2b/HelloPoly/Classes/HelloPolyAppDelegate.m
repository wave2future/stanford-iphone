//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Daniel Williams on 21/05/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
