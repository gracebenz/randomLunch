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

@interface lunchRandomChoiceViewController ()
-(void) configureView;
@end

@implementation lunchRandomChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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





@end

