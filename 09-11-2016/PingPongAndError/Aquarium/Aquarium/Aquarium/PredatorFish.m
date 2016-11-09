//
//  PredatorFish.m
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PredatorFish.h"

@implementation PredatorFish

- (PredatorFish *)initWithData:(int)weight {

    self.weight = weight;
    self.typeOfFish = @"PredatorFish";
    return self;
}

- (BOOL)canIEatYou:(NSString *)typeOfFish {
    return [self.typeOfFish isEqualToString: typeOfFish];
};

- (BOOL)letsGetDinner:(Fish*)fish {
//    if ([canIEatYou fish.typeOfFish]) {
//
//    };
    BOOL dinnerIsOk = false;

    if(![self.typeOfFish isEqualToString: fish.typeOfFish]) {
        _weight = _weight + fish.weight;
        dinnerIsOk = TRUE;
    }

    return dinnerIsOk;
};

@synthesize weight = _weight;
- (void)setWeight:(int)newWeight {
//    int maxValue = 10;
//    int minValue = 10;
//
//    if (!newWeight) {
//        int newWeightTemp = newWeight;
//        if (newWeight > maxValue || newWeight < minValue) {
//            NSLog(@"Weight must be = '%d'",maxValue);
//            newWeightTemp = maxValue;
//        }
//        _weight = newWeightTemp;
//    } else {
//        _weight = 0;
//    }
    _weight = newWeight;
};

@end
