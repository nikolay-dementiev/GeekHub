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

- (Country *)getModelInstanse {
    return countryModel;
}

- (void)setNumberOfResidentsInCountry:(int)newValue {
    countryModel.numberOfResidents = newValue;
}

- (int)numberOfResidentsInCountry {
    return countryModel.numberOfResidents;
}

- (int)numberOfResidentsInResidentSet {
    return [countryModel.residentSet count];
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
    int randomTickResident = [Helper getRandomInt: [self numberOfResidentsInResidentSet] min:0];
    ResidentItem *randomResident = countryModel.residentSet.descriptionInArray [randomTickResident];

    //1. move him -> from residentSet to: borderControlSet

    [self moveEmigrantFrom:randomResident
               moveHimFrom:countryModel.residentSet
            moveHimToPlace:countryModel.borderControlSet];

    [self moveResidentThroughBorder:randomResident];

}

- (void)moveResidentThroughBorder:(ResidentItem *)potentialViolator {
    //1. ret randon guardMan
    Guard *currentGuardMab = [_borderController getAnyGuardMan];

    //2. chek on - if resident has any forbidden item
    if ([_borderController residentHasForbiddenItem:potentialViolator
                                           guardMan:currentGuardMab]) {
        //yes - he has
        //move him -> in jail: prisonSet

        //there we need some analytics - thant's why transform item type
        PrisonItem *thiefInPrison = [[[PrisonItem new]
                                      initWithEmData:potentialViolator.emigrantMan]
                                     initWithGuard:currentGuardMab];

        [self moveEmigrantFrom: [NSArray arrayWithObjects: potentialViolator, nil]
                 recordsForAdd: [NSArray arrayWithObjects: thiefInPrison, nil]
                   moveHimFrom: countryModel.borderControlSet
                moveHimToPlace:countryModel.prisonSet];

        //collect some analitic
        _residentWereInJail++;

    } else {
        //no - he is clean
        //move him -> in at will: receptionCenterSet

        [self moveEmigrantFrom:potentialViolator
                   moveHimFrom:countryModel.borderControlSet
                 moveHimToPlace:countryModel.receptionCenterSet];
    }
}

- (void)moveAllPeopleToAnotherCountryArea:(Country *)destinationCountry {

    NSArray *arryOfSetItems = countryModel.receptionCenterSet.descriptionInArray;

    for (BoundaryStorageItem *itemInStorage in arryOfSetItems) {
        [self moveEmigrantFrom:itemInStorage
                   moveHimFrom:countryModel.receptionCenterSet
                moveHimToPlace:destinationCountry.emigrantSet];

        //collect some analitic
        _successfullyCrossedTheBorder++;
        if ([itemInStorage.emigrantMan.bagAndHistory count] > 0) {
            _residentsWithOffenseManagedToCrossTheBorder++;
        }
    }
}

- (void)moveEmigrantFrom:(BoundaryStorageItem *)movableRecord
             moveHimFrom:(BoundaryStorageSet*)fromPlace
           moveHimToPlace:(BoundaryStorageSet*)toPlace {
    
    [fromPlace deleteRecord: movableRecord];
    [toPlace addRecord: movableRecord];
    
}

- (void)moveEmigrantFrom:(NSArray *)recordsForRemove
           recordsForAdd:(NSArray *)recordsForAdd
             moveHimFrom:(BoundaryStorageSet*)fromPlace
          moveHimToPlace:(BoundaryStorageSet*)toPlace {

    for (BoundaryStorageItem *movableRecord in recordsForRemove) {
        [fromPlace deleteRecord: movableRecord];
    }

    for (BoundaryStorageItem *movableRecord in recordsForAdd) {
        [toPlace addRecord: movableRecord];
    }
}

- (float)calculateValueInPrecentOfOvelAll:(int)inputValue {
    float valueToReturn = 0;

    int allValue = [self numberOfResidentsInCountry];
    if (allValue > 0) {
        valueToReturn = (100 * inputValue)/allValue;
    }

    return valueToReturn;
}

@end
