//
//  lunchLocation.m
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import "lunchLocation.h"
#import "lunchMasterViewController.h" 

//NSUInteger timesVisited = 0;


@implementation lunchLocation

-(id)initWithName:(NSString *)name{
    self = [super init];
    if (self){
        _name = name;
        if (!self.theCount) _theCount = 0;

        return self; 
    }
    return nil; 
}

-(NSUInteger) returnCount {
    return _theCount;
}

-(void)setCount:(NSUInteger)count{
    self.theCount = count;
}

-(void) incrementCount {
    _theCount ++;
}

-(NSMutableArray *)getArray{
    NSMutableArray *obj = [NSMutableArray arrayWithCapacity:1];
    [obj insertObject:_name atIndex:0];
    return obj;
}

+(lunchLocation *) fromArray:(NSMutableArray *)locationArray{
    lunchLocation *location;
    location = [[lunchLocation alloc] initWithName:[locationArray objectAtIndex:0]];
    return location;
}


#define kNameKey      @"Name"
#define kCountKey     @"Count" 

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_name forKey:kNameKey];
    [encoder encodeInt:_theCount forKey:kCountKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    self.name = [decoder decodeObjectForKey:kNameKey];
    self.theCount = [decoder decodeIntegerForKey:kCountKey];
    
    return self; 
}


@end
