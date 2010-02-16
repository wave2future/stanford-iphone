//
//  PersonListViewController.h
//  Presence
//
//  Created by Daniel Williams on 26/11/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonListViewController : UITableViewController {
    NSMutableArray *list;
}

@property (nonatomic, retain) NSMutableArray *list;

@end
