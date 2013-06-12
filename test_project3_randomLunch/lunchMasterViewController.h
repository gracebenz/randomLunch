//
//  lunchMasterViewController.h
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class lunchLocationDataController;


@interface lunchMasterViewController : UITableViewController


@property (strong, nonatomic) lunchLocationDataController *dataController;


-(IBAction)cancel:(UIStoryboardSegue *)segue;

-(IBAction)done:(UIStoryboardSegue *)segue;



@end
