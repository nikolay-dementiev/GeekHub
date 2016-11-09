//
//  Helper.m
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Helper.h"

@implementation Helper

+ (int)getRandomInt: (int)maxValue
                min:(int)minValue {
    int lowerBound = minValue;
    int upperBound = maxValue;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);

    return rndValue;
};

@end
