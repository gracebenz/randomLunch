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

- (lunchLocation *) objectInListAtIndex:(NSUInteger)theIndex;

- (void)addLunchLocationWithName:(lunchLocation *)location;


@end
