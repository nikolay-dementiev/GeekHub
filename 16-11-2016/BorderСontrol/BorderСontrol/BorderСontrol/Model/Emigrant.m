//
//  Emigrant.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Emigrant.h"
#import "Helper.h"

@implementation Emigrant

- (instancetype)init {

    self = [super init];

    if (self) {
        self.classPrefix = @"Emi";
    }

    return self;
}

- (instancetype)initWithRandomParameters {

    self = [super initWithRandomParameters];

    _bagAndHistory = [self createRandomHistoryForEmigrant];

    return self;
}

-(NSArray *)createRandomHistoryForEmigrant {

    NSMutableArray *arrayOfListHistory = [[NSMutableArray alloc] init];

    NSArray *arrayList = [Helper getArrayPositionForCheking];

    int doomInt = 10;//10% chance to have every banned item in his history
    for (int i = 0; i<[arrayList count]; i++) {
        int riscVal = [Helper getRandomInt:doomInt+1 min:0];

        if (riscVal == doomInt) {
            PositionForCheking itemType = [arrayList[i] intValue];
            [arrayOfListHistory addObject:@(itemType)];
        }
    }

    return arrayOfListHistory;
}

@end
