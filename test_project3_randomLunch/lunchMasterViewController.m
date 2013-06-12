//
//  lunchMasterViewController.m
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import "lunchMasterViewController.h"

#import "lunchDetailViewController.h"

#import "lunchLocationDataController.h"

#import "lunchLocation.h" 

#import "lunchAddLocationViewController.h"

#import "lunchRandomChoiceViewController.h" 

/*
@interface lunchMasterViewController () {
    NSMutableArray *_objects;
}
@end
*/
@implementation lunchMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[lunchLocationDataController alloc] init];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)done:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {

        lunchAddLocationViewController *addController = [segue sourceViewController];
                
        if(addController.lunchLocation) {
            [self.dataController addLunchLocationWithName:addController.lunchLocation];
            [[self tableView] reloadData];
        }
        //NSLog(@"%d", [self.dataController countOfList]);

        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

-(void)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL]; 
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"lunchLocationCell";
    

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    lunchLocation *locationAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    
    [[cell textLabel] setText:locationAtIndex.name];
    
    return cell; 
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"randomize"]) {
        int randomIndex = arc4random() % [self.dataController countOfList];
        lunchLocation *locationAtIndex = [self.dataController objectInListAtIndex:(randomIndex)];
        NSString *locationString = locationAtIndex.name;
        
        //have to do this because using a nacigation controller to get to random view contorller 
        UINavigationController *navigationController = segue.destinationViewController; 
        lunchRandomChoiceViewController *randomViewController = (id)[[navigationController viewControllers] objectAtIndex:0];

        randomViewController.randomChoice = locationString;


    }
}


/*
 - (void)insertNewObject:(id)sender
 {
 if (!_objects) {
 _objects = [[NSMutableArray alloc] init];
 }
 [_objects insertObject:[NSDate date] atIndex:0];
 NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
 [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
 }
 */


/*
 
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 [_objects removeObjectAtIndex:indexPath.row];
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */
/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (IBAction)randomize:(UIBarButtonItem *)sender {
}
@end
