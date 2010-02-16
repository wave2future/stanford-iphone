//
//  PersonListViewController.m
//  Presence
//
//  Created by Daniel Williams on 26/11/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonListViewController.h"
#import "PresenceAppDelegate.h"
#import "Person.h";
#import "TweetListViewController.h"


@implementation PersonListViewController

@synthesize list;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	if (list == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TwitterUsers" 
                                                         ofType:@"plist"];
        NSMutableArray *array = [[NSMutableArray alloc] 
                                 initWithContentsOfFile:path];
		
		// create objects, load from twitter, add to an array
		NSMutableArray *twits = [[NSMutableArray alloc] init];
		for(NSString *screen_name in array) {
			NSObject *person = [[Person alloc] initWithScreenName:screen_name];
			[twits addObject:person];
			[person release];
		}
		
        self.list = twits;
        [array release];
		[twits release];
    }
	
	
    self.title = @"People";
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.list = nil;
}


- (void)dealloc {
    [list release];
    [super dealloc];
}




#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *FirstLevelCell= @"FirstLevelCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
                             FirstLevelCell];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                       reuseIdentifier: FirstLevelCell] autorelease];
    }
    // Configure the cell
	
    NSInteger row = [indexPath row];
	Person *person = [self.list objectAtIndex:row];
	
    cell.textLabel.text = person.display;
	cell.detailTextLabel.text = person.screen;
	cell.imageView.image = person.image;
	
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
    NSInteger row = [indexPath row];
	Person *person = [self.list objectAtIndex:row];

	TweetListViewController *tweetController = [[TweetListViewController alloc] initWithStyle:UITableViewStylePlain];
	
	tweetController.person = person;
	
	[self.navigationController pushViewController:tweetController animated:YES];}

@end
