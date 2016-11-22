//
//  CountryController.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 21.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef CountryController_h
#define CountryController_h
@class Country;
@class BoundaryStorageItem;
@class BoundaryStorageSet;

#import "BorderControlController.h"

@interface CountryController : NSObject {
    Country *countryModel;
}

@property (readwrite, retain, nonatomic) BorderControlController *borderController;
@property (readwrite, retain, nonatomic) NSString *nameOfModelCountry;

@property (nonatomic) int numberOfResidentsInCountry;

- (instancetype)initWithModelName:(NSString *)countryModelName;
- (instancetype)initWithModel:(Country *)countryM;
- (void)initiateResidents;
- (void)moveEmigrantFrom:(BoundaryStorageItem *)movableRecord
             moveHimFrom:(BoundaryStorageSet*)fromPlace
          moveHimToPlace:(BoundaryStorageSet*)toPlace;
//-(Country *)getModelInstanse;

- (void)moveAcrossBorderAnyOfResydent;

@end

#endif /* CountryController_h */
