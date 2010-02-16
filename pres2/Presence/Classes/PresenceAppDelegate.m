//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by Daniel Williams on 25/11/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"

@implementation PresenceAppDelegate

@synthesize window;
@synthesize navController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    [window addSubview: navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [navController release];
    [super dealloc];
}


@end
