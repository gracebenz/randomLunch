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
    self.lunchLocationsList = [self getLocationsFromCache];
    //NSLog(@"from cache %d", [[self.lunchLocationsList objectAtIndex:0] returnCount] );

    if([self.lunchLocationsList count]<1){
        lunchLocation *location;
        location = [[lunchLocation alloc] initWithName:@"Pret"];
        [self addLunchLocationWithName: location];
    }
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

-(int) indexOfObject: (lunchLocation *)location {
    for (int i = 0; i < self.countOfList; i++) {
        if ([self.lunchLocationsList objectAtIndex:i] == location) {
            return i;
        }
    }
    return 0;
}


-(lunchLocation *) objectInListAtIndex:(NSUInteger)theIndex {
    return [self.lunchLocationsList objectAtIndex:theIndex];
}

- (lunchLocation *)objectInListWithName: (lunchLocation *)theLocation{
    for (int i = 0; i < self.countOfList; i++) {
        if ([self.lunchLocationsList objectAtIndex:i] == theLocation) {
            return [self.lunchLocationsList objectAtIndex:i];
        }
    }
    return NULL; 
}

-(void)setLunchLocationCount: (NSUInteger)count :(lunchLocation *)location {
    int indexOfObject = [self indexOfObject:location];
    [location setCount:count];
    
    [self.lunchLocationsList replaceObjectAtIndex:indexOfObject withObject:location];
    
    [self cacheLocations];
}

-(void) incrementLunchLocationWithName: (lunchLocation *)location {
    int indexOfObject = [self indexOfObject:location];
    [location incrementCount];
    
    [self.lunchLocationsList replaceObjectAtIndex:indexOfObject withObject:location];

    [self cacheLocations];
}


-(void) addLunchLocationWithName:(lunchLocation *)location {
    [self.lunchLocationsList addObject:location];
    [self cacheLocations];
}

-(void) removeObjectFromLunchLocationsListAtIndex:(NSUInteger)index {
    [self.lunchLocationsList removeObjectAtIndex:index];
    [self cacheLocations]; 
}


-(void)cacheLocations {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:[NSKeyedArchiver archivedDataWithRootObject:self.lunchLocationsList] forKey:@"nsLocationCacheKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


//get cached list of locations 
-(NSMutableArray *) getLocationsFromCache{

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *dataRepresentingSavedArray = [prefs objectForKey:@"nsLocationCacheKey"];
    
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    if (!dataRepresentingSavedArray) return locations;
    
    NSArray *cachedSavedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
    [locations addObjectsFromArray:cachedSavedArray];    
    return locations;
}


@end





//-(void) cacheLocation: (lunchLocation *)location{



//NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
/*
 
 NSMutableArray *locationArray = [location getArray];
 NSMutableArray *newLocations = [[NSMutableArray alloc] init];
 [newLocations addObjectsFromArray:[prefs objectForKey:@"locationCacheKey"]];
 
 [newLocations addObject:locationArray];
 
 [prefs setObject:newLocations forKey:@"locationCacheKey"];
 */

// [prefs setObject:[NSKeyedArchiver archivedDataWithRootObject:self.lunchLocationsList] forKey:@"nsLocationCacheKey"];

//}

/*
 NSMutableArray *locationCache;
 NSMutableArray *locations;
 
 
 locationCache = [prefs objectForKey:@"locationCacheKey"];
 locations = [[NSMutableArray alloc] init];
 
 for(int i=0; i<[locationCache count]; i++){
 [locations addObject: [lunchLocation fromArray:[locationCache objectAtIndex:i]]];
 }
 */

