//
//  customviewAppDelegate.m
//  customview
//
//  Created by Daniel Williams on 28/05/2009.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "customviewAppDelegate.h"

@implementation customviewAppDelegate

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
