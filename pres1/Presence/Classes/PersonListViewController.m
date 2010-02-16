//
//  PersonListViewController.m
//  Presence
//
//  Created by Daniel Williams on 26/11/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonListViewController.h"
#import "PresenceAppDelegate.h"
#import "PersonDetailViewController.h"


@implementation PersonListViewController

@synthesize list;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	if (list == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"People" 
                                                         ofType:@"plist"];
        NSMutableArray *array = [[NSMutableArray alloc] 
                                 initWithContentsOfFile:path];
        self.list = array;
        [array release];
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
    [childController release];
    childController = nil;
}


- (void)dealloc {
    [list release];
    [childController release];
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
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier: FirstLevelCell] autorelease];
    }
    // Configure the cell
	
    NSInteger row = [indexPath row];
	NSDictionary *person = [self.list objectAtIndex:row];
    cell.textLabel.text = [person objectForKey:@"name"];
	cell.imageView.image = [UIImage imageNamed:[person objectForKey:@"image"]];
	
    return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (childController == nil)
        childController = [[PersonDetailViewController alloc] 
                           initWithNibName:@"PersonDetail" bundle:nil];
    
    childController.title = @"Person";
    NSUInteger row = [indexPath row];
    
    childController.person = [self.list objectAtIndex:row];
	
    childController.title = [childController.person objectForKey:@"name"];
	
    [self.navigationController pushViewController:childController
     animated:YES];
}

@end
