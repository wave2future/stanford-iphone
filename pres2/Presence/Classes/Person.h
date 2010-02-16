//
//  Person.h
//  Presence
//
//  Created by Daniel Williams on 03/12/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *screen;
	NSString *display;
	UIImage *image;
	NSArray *tweets;
}

@property (nonatomic, retain) NSString *screen;
@property (nonatomic, retain) NSString *display;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSArray *tweets;

@end
