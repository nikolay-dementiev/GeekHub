//
//  BorderControlController.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BorderControlController.h"
#import "Country.h"
#import "Guard.h"
#import "Emigrant.h"
#import "BorderControlSet.h"
#import "BorderControlItem.h"
#import "BoundaryStorageItem.h"
#import "ResidentItem.h"
#import "Helper.h"

@implementation BorderControlController

- (instancetype)initWithModel:(Country *)countryM {
    self = [super init];

    if (self) {
        countryModel = countryM;
    }

    return self;
}

- (void)initiateGuards:(int)numberOfGuards {

    for (int i = 0; i < numberOfGuards; i ++) {
        Guard *newMan = [[Guard new] initWithRandomParameters];
        [countryModel.borderControlSet.guardMan addObject:newMan];
    }
}

- (Guard *)getAnyGuardMan {
    BorderControlSet *borderModelSet = countryModel.borderControlSet;

    int conutnOfGuardMan = (int)[borderModelSet.guardMan count];

    if (conutnOfGuardMan > 0) {
        int randomTick = [Helper getRandomInt:conutnOfGuardMan min:0];

        return borderModelSet.guardMan[randomTick];
    } else {

        return nil;
    }
}

- (BOOL)residentHasForbiddenItem:(ResidentItem *)resident
                        guardMan:(Guard *)guardMan {

    Emigrant *emigrantCurrent = resident.emigrantMan;
    BOOL emigrantHasSomeItem = false; //presumption of innocence

    if ([emigrantCurrent.bagAndHistory count] > 0) {
        NSArray *possitionForChek = [Helper getArrayPositionForCheking];

        for (int i = 0; i<[possitionForChek count]; i++) {

            if (emigrantHasSomeItem) {
                break;
            }

            int reductionFactor = 4;//Мешканець країни має 4% шанс отримати кожен заборонений критерій.
            int randomTickOfLucky = [Helper getRandomInt:100-reductionFactor min:0];
            if (randomTickOfLucky <= [guardMan rateFindOffense]) {
                //don't lucky
                emigrantHasSomeItem = true;
            } else {
                //lucky guy!
            }
            //these details are not necessary
            //PositionForCheking itemType = [possitionForChek[i] intValue];
        }
    }

    return  emigrantHasSomeItem;
}


@end
