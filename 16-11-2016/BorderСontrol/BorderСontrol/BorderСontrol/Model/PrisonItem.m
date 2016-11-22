//
//  PrisonItem.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrisonItem.h"
#import "Guard.h"

@implementation PrisonItem

- (instancetype)initWithGuard:(Guard *)guardMan {
    self = [super init];

    if (self) {
        _guardMan = guardMan;
    }

    return self;
}

@end
