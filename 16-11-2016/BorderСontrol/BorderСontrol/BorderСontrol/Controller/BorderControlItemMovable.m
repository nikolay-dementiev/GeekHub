//
//  BorderControlItem.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BorderControlItemMovable.h"

@implementation BorderControlItemMovable

- (instancetype)initWithData:(CountryController *)countryControl
                 destination:(Country *)destinationCountry {

    _countryController = countryControl;
    _destinationCountry = destinationCountry;

    return self;
}

@end
