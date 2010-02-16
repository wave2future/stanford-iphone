//
//  PersonDetailViewController.h
//  Presence
//
//  Created by Daniel Williams on 30/11/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PersonDetailViewController : UIViewController {
	UILabel *nameLabel;
	UILabel *status;
	UIImageView *pic;
	NSDictionary *person;
}

@property (nonatomic, retain) IBOutlet UILabel *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel *status;
@property (nonatomic, retain) IBOutlet UIImageView *pic;
@property (nonatomic, retain) NSDictionary *person;

@end
