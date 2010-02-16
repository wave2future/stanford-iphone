//
//  TweetListViewController.h
//  Presence
//
//  Created by Daniel Williams on 12/02/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface TweetListViewController : UITableViewController {
	Person *person;
}

@property (nonatomic, retain) Person *person;

@end
