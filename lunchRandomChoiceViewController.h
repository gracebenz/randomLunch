//
//  lunchRandomChoiceViewController.h
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/11/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class lunchLocationDataController;
@class lunchLocation; 

@interface lunchRandomChoiceViewController : UIViewController  

@property (weak, nonatomic) NSMutableArray *alreadySuggested;

@property (weak, nonatomic) lunchLocation *randomLunchLocation; 
@property (weak, nonatomic) NSString *randomChoice;
@property (weak, nonatomic) IBOutlet UILabel *randomChoiceLabel;

@property (strong, nonatomic) lunchLocationDataController *dataController; 

- (IBAction)randomizeAgain:(id)sender;


@end

