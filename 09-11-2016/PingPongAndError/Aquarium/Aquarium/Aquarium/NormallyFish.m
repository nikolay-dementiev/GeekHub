//
//  NormallyFish.m
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NormallyFish.h"

@implementation NormallyFish

- (NormallyFish *)initWithData:(int)weight {

    self.weight = weight;
    self.typeOfFish = @"NormallyFish";
    return self;
}

-  (BOOL)canIEatYou:(NSString *)typeOfFish {
    return false;
};

@synthesize weight = _weight;
- (void)setWeight:(int)newWeight {
    int maxValue = 9;
    int minValue = 0;

    if (newWeight > 0) {
        int newWeightTemp = newWeight;
        if (newWeight > maxValue || newWeight < minValue) {
            NSLog(@"Weight must be < '%d' and > '%d'",maxValue,minValue);
            newWeightTemp = maxValue;
        }
        _weight = newWeightTemp;
    } else {
        _weight = 0;
    }
}

@end
