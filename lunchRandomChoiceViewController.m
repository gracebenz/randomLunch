//
//  lunchRandomChoiceViewController.m
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/11/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import "lunchRandomChoiceViewController.h"
#import "lunchLocation.h" 
#import "lunchMasterViewController.h" 
#import "lunchLocationDataController.h" 


@interface lunchRandomChoiceViewController ()
-(void) configureView;
@end

@implementation lunchRandomChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //cutsom initialization
    }
    return self;
}

-(void)configureView
{
    NSString *choice = [[NSString alloc] initWithFormat:@"%@!", _randomChoice];
    
    self.randomChoiceLabel.text = choice;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView]; 
	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)randomizeAgain:(id)sender
{
    //NSMutableArray *alreadySuggested = [[NSMutableArray alloc] init];
    NSString *locationString = _randomChoice;
    
    while (locationString == _randomChoice) {
        int randomIndex = arc4random() % [self.dataController countOfList];
        lunchLocation *locationAtIndex = [self.dataController objectInListAtIndex:(randomIndex)];
        locationString = locationAtIndex.name;
        self.randomLunchLocation = locationAtIndex; 
        
    }
    
    _randomChoice = locationString;
    NSString *choice = [[NSString alloc] initWithFormat:@"What about... %@!?", _randomChoice];
    
    
    self.randomChoiceLabel.text = choice; 
    
}
@end

