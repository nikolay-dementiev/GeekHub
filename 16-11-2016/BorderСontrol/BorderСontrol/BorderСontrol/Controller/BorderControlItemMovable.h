//
//  BorderControlItem.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef BorderControlItem_h
#define BorderControlItem_h
#import "CountryController.h"
#import "Country.h"

@interface BorderControlItemMovable : NSObject

@property (readwrite, strong, nonatomic) Country *destinationCountry;
@property (readwrite, strong, nonatomic) CountryController *countryController;

- (instancetype)initWithData:(CountryController *)countryControl
                 destination:(Country *)destinationCountry;

@end

#endif /* BorderControlItem_h */
