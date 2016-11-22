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

    int reductionFactor = 4;//Мешканець країни має 4% шанс отримати кожен заборонений критерій.
    for (int i = 0; i<[arrayList count]; i++) {
        int riscVal = [Helper getRandomInt:100 min:1];

        if (reductionFactor >= riscVal) {
            PositionForCheking itemType = [arrayList[i] intValue];
            [arrayOfListHistory addObject:@(itemType)];
        }
    }

    return arrayOfListHistory;
}

@end
