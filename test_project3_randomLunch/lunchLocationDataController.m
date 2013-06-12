//
//  lunchLocationDataController.m
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import "lunchLocationDataController.h"
#import "lunchLocation.h" 

@interface lunchLocationDataController ()
-(void)initializeDefaultDataList;
@end

@implementation lunchLocationDataController

-(void) initializeDefaultDataList {
    NSMutableArray *locationsList = [[NSMutableArray alloc] init];
    self.lunchLocationsList = locationsList;
    lunchLocation *location;
    location = [[lunchLocation alloc] initWithName: @"Pret"];
    [self addLunchLocationWithName:location];
}

-(void)setLunchLocationsList:(NSMutableArray *)newList {
    if(_lunchLocationsList !=newList) {
        _lunchLocationsList = [newList mutableCopy];
    }
}

-(id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self; 
    }
    return nil;
}


-(NSUInteger) countOfList {
    return [self.lunchLocationsList count];
}

-(lunchLocation *) objectInListAtIndex:(NSUInteger)theIndex {
    return [self.lunchLocationsList objectAtIndex:theIndex];
}

-(void) addLunchLocationWithName:(lunchLocation *)location {
    [self.lunchLocationsList addObject:location]; 
}


@end
