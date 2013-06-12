//
//  lunchLocation.m
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import "lunchLocation.h"

@implementation lunchLocation

-(id)initWithName:(NSString *)name{
    self = [super init];
    if (self){
        _name = name;
        return self; 
    }
    return nil; 
}



@end
