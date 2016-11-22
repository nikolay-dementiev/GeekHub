//
//  Guard.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guard.h"
#import "Helper.h"

@implementation Guard

- (instancetype)init {

    self = [super init];

    if (self) {
        self.classPrefix = @"Gua";
    }

    return self;
}

- (instancetype)initWithRandomParameters {

    self = [super initWithRandomParameters];
    _rateFindOffense = [Helper getRandomInt:80 min:10];

    return self;
}


@end
