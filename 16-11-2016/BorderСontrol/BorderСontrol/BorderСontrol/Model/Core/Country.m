//
//  Country.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "PrisonStorageSet.h"
#import "BoundaryStorageSet.h"

@implementation Country

- (instancetype)initWithName:(NSString *)nameOfCountry {

    _name = nameOfCountry;

    return self;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        _prisonSet = [PrisonStorageSet new];
        _residentSet = [BoundaryStorageSet new];
        _borderControlSet = [BorderControlSet new];
        _receptionCenterSet = [BoundaryStorageSet new];
        _emigrantSet = [BoundaryStorageSet new];
    }

    return self;
}

@end
