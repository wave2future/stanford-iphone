//
//  Person.h
//  Presence
//
//  Created by Daniel Williams on 03/12/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
	NSString *name;
	NSString *status;
	NSString *image;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *image;

@end
