//
//  Human.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Human.h"
#import "Helper.h"

@implementation Human

- (instancetype)initWithRandomParameters {

    _name = [_classPrefix stringByAppendingString: [Helper getRandomHumanName:15]];

    return self;
}

- (instancetype)init {

    self = [super init];

    if (self) {
        _classPrefix = @"Hum";
    }

    return self;
}

@end
