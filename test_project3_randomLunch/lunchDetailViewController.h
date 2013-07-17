//
//  lunchDetailViewController.h
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class lunchLocation;

@class lunchLocationDataController; 

@interface lunchDetailViewController : UIViewController

@property (weak, nonatomic) NSString *locationCount; 

@property (weak, nonatomic) IBOutlet UILabel *locationCountLabel;

@property (strong, nonatomic) lunchLocationDataController *dataController;

@property (strong, nonatomic) lunchLocation *lunchLocation;

@property (assign, nonatomic) BOOL reset;

- (IBAction)reset:(id)sender;

@end
