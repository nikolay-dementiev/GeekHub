//
//  BorderControlController.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BorderControlController.h"
#import "Guard.h"
#import "BorderControlSet.h"
#import "BorderControlItem.h"
#import "Country.h"
#import "Emigrant.h"

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


@end
