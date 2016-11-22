//
//  CountryController.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 21.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountryController.h"
#import "Country.h"
#import "Emigrant.h"
#import "ResidentItem.h"
#import "BorderControlController.h"
#import "Helper.h"
//#import "Res"

@implementation CountryController

- (instancetype)initWithModel:(Country *)countryM {
    self = [super init];

    if (self) {
        countryModel = countryM;
        _borderController = [[BorderControlController new] initWithModel:countryModel];

        _nameOfModelCountry = countryM.name;
    }

    return self;
}

- (instancetype)initWithModelName:(NSString *)countryModelName {

    Country *curCountry = [[Country new] initWithName: countryModelName];
    self = [self initWithModel:curCountry];

    return self;
}

//-(Country *)getModelInstanse {
//    return countryModel;
//}

- (void)setNumberOfResidentsInCountry:(int)newValue {
    countryModel.numberOfResidents = newValue;
}

- (int)numberOfResidentsInCountry {
    return countryModel.numberOfResidents;
}



- (void)initiateResidents {

    for (int i = 0; i < countryModel.numberOfResidents; i ++) {
        Emigrant *newResident = [[Emigrant new] initWithRandomParameters];
        ResidentItem *newResidentItem = [[ResidentItem new] initWithEmData:newResident];

        [countryModel.residentSet addRecord:newResidentItem];
    }
}

//MARK: borderController

- (void)moveAcrossBorderAnyOfResydent {

    // get random resident
    int randomTickResident = [Helper getRandomInt: self.numberOfResidentsInCountry min:0];
    ResidentItem *randomResident = countryModel.residentSet.descriptionInArray [randomTickResident];

    //1. move him residentSet -> borderControlSet

    [self moveEmigrantFrom:randomResident
               moveHimFrom:countryModel.residentSet
            moveHimToPlace:countryModel.borderControlSet];


//                          :randomResident
//               moveHimFrom: countryModel.residentSet
//             moveItToPlace:countryModel.borderControlSet];

    [self moveResidentThroughBorder:randomResident];


    //    [selectedCountryController ]descriptionInArray
}

- (void)moveResidentThroughBorder:(ResidentItem *)potentialViolator {
    //1. ret randon guardMan
    Guard *currentGuardMab = [_borderController getAnyGuardMan];

    //2. chek on - if resident has any forbidden item
    if ([_borderController residentHasForbiddenItem:potentialViolator
                                           guardMan:currentGuardMab]) {
        //yes - he has
        //move him in jail: prisonSet
        [self moveEmigrantFrom:potentialViolator
                   moveHimFrom:countryModel.borderControlSet
                 moveHimToPlace:countryModel.prisonSet];

    } else {
        //no - he is clean
        //move him in at will: receptionCenterSet


//        PrisonItem *newItem = [[[PrisonItem new]
//                                initWithEmData:potentialViolator.emigrantMan]
//                               initWithGuard:currentGuardMab];


        [self moveEmigrantFrom:potentialViolator
                   moveHimFrom:countryModel.borderControlSet
                 moveHimToPlace:countryModel.receptionCenterSet];

    }


}

- (void)moveEmigrantFrom:(BoundaryStorageItem *)movableRecord
             moveHimFrom:(BoundaryStorageSet*)fromPlace
           moveHimToPlace:(BoundaryStorageSet*)toPlace {
    
    [fromPlace deleteRecord: movableRecord];
    [toPlace addRecord: movableRecord];
    
}


@end
