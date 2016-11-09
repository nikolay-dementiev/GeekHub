//
//  Fish.m
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fish.h"

@implementation Fish

- (BOOL)canIEatYou:(NSString *)typeOfFish {
    return false;
};

@synthesize weight = _weight;
//property 'weight' set/get-tter
- (void)setWeight:(int)newWeight {
    if (newWeight) {
        _weight = newWeight;
    } else {
        _weight = 0;
    }
}

- (int)weight {
    if (!_weight) {
        _weight = 0;
    }
    return _weight;
}

@end
