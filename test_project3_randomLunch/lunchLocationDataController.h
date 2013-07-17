//
//  lunchLocationDataController.h
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import <Foundation/Foundation.h>
@class lunchLocation; 
@interface lunchLocationDataController : NSObject

@property(nonatomic, copy)NSMutableArray *lunchLocationsList;

- (NSUInteger) countOfList;

-(int) indexOfObject: (lunchLocation *)location;

- (lunchLocation *) objectInListAtIndex:(NSUInteger)theIndex;

- (lunchLocation *)objectInListWithName: (lunchLocation *)theLocation;

-(void) incrementLunchLocationWithName: (lunchLocation *)location; 

-(void) addLunchLocationWithName:(lunchLocation *)location;

-(void)setLunchLocationCount: (NSUInteger)count :(lunchLocation *)location;

-(void) removeObjectFromLunchLocationsListAtIndex:(NSUInteger)index;

-(void)cacheLocations; 

//-(void) removeLunchLocationsListObject:(lunchLocation *)objectToBeRemoved;

//-(NSMutableArray *) getLocationsFromCache;



@end
