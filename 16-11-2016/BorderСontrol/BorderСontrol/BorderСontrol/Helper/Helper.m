//
//  Helper.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Helper.h"

@implementation Helper

+ (NSArray *)getArrayPositionForCheking {

    NSMutableArray *tArray = [[NSMutableArray alloc] initWithObjects:
                              @(drugs),
                              @(guns),
                              @(forbiddenSubstances),
                              @(criminalPast),
                              @(isBeingSought)
                              ,nil];

    return tArray;
}

+ (int)getRandomInt:(int)maxValue
                min:(int)minValue {
    int lowerBound = minValue;
    int upperBound = maxValue;

    int rndValue;
    if (lowerBound == upperBound) {
        rndValue = lowerBound;
    } else {
        rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    }

    return rndValue;
};

+ (BOOL)getRandomBool
{
    int tmp = (arc4random() % 30)+1;
    if(tmp % 5 == 0)
        return YES;
    return NO;
}

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+ (NSString *)randomStringWithLength:(int)len {

    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];

    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }

    return randomString;
}

+ (NSString *)getRandomHumanName:(int)maxNameLenth {

    return [Helper randomStringWithLength: [Helper getRandomInt:maxNameLenth min:3]];
}

@end
