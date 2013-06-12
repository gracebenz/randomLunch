//
//  lunchAddLocationViewController.h
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class lunchLocation;

@interface lunchAddLocationViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *locationNameInput;

@property (strong, nonatomic) lunchLocation *lunchLocation; 

@end
