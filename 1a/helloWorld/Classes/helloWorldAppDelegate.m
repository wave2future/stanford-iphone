//
//  helloWorldAppDelegate.m
//  helloWorld
//
//  Created by Daniel Williams on 18/05/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "helloWorldAppDelegate.h"

@implementation helloWorldAppDelegate

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
