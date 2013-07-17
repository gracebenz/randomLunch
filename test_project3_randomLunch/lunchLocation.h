//
//  lunchLocation.h
//  test_project3_randomLunch
//
//  Created by freelance_bns on 6/10/13.
//  Copyright (c) 2013 freelance_bns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lunchLocation : NSObject <NSCoding>

@property (strong, nonatomic)NSString *name;

@property (assign, nonatomic) NSUInteger theCount;

//+(NSUInteger) timesVisited;

-(void) incrementCount; 

-(NSUInteger) returnCount;

-(void)setCount:(NSUInteger)count;

-(id)initWithName:(NSString *) name;

-(NSMutableArray *)getArray;

+(lunchLocation *) fromArray:(NSMutableArray *)locationArray;
- (void) encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;

@end
