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
                        
        if (addController.lunchLocation) {
            [self.dataController addLunchLocationWithName:addController.lunchLocation];
            [[self tableView] reloadData];
            
        }
        
    }
    else if ([[segue identifier] isEqualToString:@"reset"]) {
        lunchDetailViewController *detailController = [segue sourceViewController];

        if (detailController.reset){
            [self.dataController setLunchLocationCount:0 :detailController.lunchLocation];
            detailController.reset = NO;
        }
        
        [self dismissViewControllerAnimated:YES completion:NULL];

    }
}

-(void)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {

        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

-(void)chosen:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"incrementCount"]) {
        
        lunchRandomChoiceViewController *randomViewController = [segue sourceViewController]; 
        lunchLocation *randomLocation = [randomViewController randomLunchLocation];
            
        [self.dataController incrementLunchLocationWithName:randomLocation];
        [self dismissViewControllerAnimated:YES completion:NULL];

    }
}
/*
-(void)reset:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"resetLunchData"]) {
        lunchDetailViewController *detailViewController = [segue sourceViewController];
        lunchLocation *detailLocation = [detailViewController lunchLocation];
        
        [[self.dataController objectInListWithName:detailLocation] setCount: 0];
        [self dismissViewControllerAnimated:YES completion:NULL];

        
    }
}
*/


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
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"randomize"]) {
        int randomIndex = arc4random() % [self.dataController countOfList];
        lunchLocation *locationAtIndex = [self.dataController objectInListAtIndex:(randomIndex)];
        NSString *locationString = locationAtIndex.name;
        
        //have to do this because using a navigation controller to get to random view contorller 
        UINavigationController *navigationController = segue.destinationViewController; 
        lunchRandomChoiceViewController *randomViewController = (id)[[navigationController viewControllers] objectAtIndex:0];

        randomViewController.dataController = self.dataController; 
        randomViewController.randomChoice = locationString;
        randomViewController.randomLunchLocation = locationAtIndex; 

    }
    else if ([[segue identifier] isEqualToString:@"showLocationDetails"]) {
        lunchDetailViewController *detailViewController = [segue destinationViewController];
        
        NSString *locationCountString = [NSString stringWithFormat:@"%i", [[self.dataController objectInListAtIndex:[[self.tableView indexPathForSelectedRow]row] ] returnCount]];

        detailViewController.lunchLocation = [self.dataController objectInListAtIndex:[[self.tableView indexPathForSelectedRow]row]];
        detailViewController.locationCount = locationCountString; 
    
    }
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

 
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
     
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         [self.dataController removeObjectFromLunchLocationsListAtIndex:indexPath.row];
         
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
     }
      
 
 }

/*
 -(void)delete:(UIStoryboardSegue *)segue {
 if ([[segue identifier] isEqualToString:@"delete"]) {
 NSLog(@"delete prepare for segue");
 
 
 lunchDetailViewController *detailController = [segue sourceViewController];
 
 if (detailController.lunchLocation) {
 [self.dataController removeLunchLocationsListObject:detailController.lunchLocation];
 [[self tableView] reloadData];
 }
 
 [self dismissViewControllerAnimated:YES completion:NULL];
 
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


@end
