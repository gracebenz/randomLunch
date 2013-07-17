//
//  lunchDetailViewController.m
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import "lunchDetailViewController.h"
#import "lunchLocationDataController.h" 
#import "lunchLocation.h" 

@interface lunchDetailViewController ()
- (void)configureView;
@end

@implementation lunchDetailViewController

#pragma mark - Managing the detail item


- (void)setLocation:(lunchLocation *)newLocation
{
    if (_lunchLocation != newLocation) {
        _lunchLocation = newLocation;
        
        // Update the view.
        
    }
    [self configureView];

}

- (void)configureView
{
    
    self.locationCountLabel.text = self.locationCount;
}


-(IBAction)reset:(id)sender {
    self.locationCount = @"0"; 
    self.reset = YES;
    [self configureView];
    
}
/*
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

*/ 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
