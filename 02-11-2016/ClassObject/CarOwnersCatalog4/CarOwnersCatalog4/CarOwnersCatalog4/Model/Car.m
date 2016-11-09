//
//  Car.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@implementation Car

@synthesize number = _number;

- (id)initWithData: (NSString *)tNumber {

    _number = tNumber;

    return self;
};

//property 'number' set/get-tter
- (void)setNumber:(NSString *)number {
    if (number) {
        _number = number;
    } else {
        _number = @"null";
    }
}

- (NSString *)number {
    if (!_number) {
        _number = @"null";
    }
    return _number;
}


@end
