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
//#import "Res"

@implementation CountryController

- (instancetype)initWithModel:(Country *)countryM {
    self = [super init];

    if (self) {
        countryModel = countryM;
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

- (void)setNumberOfResidents:(int)count {
    countryModel.numberOfResidents = count;
}



- (void)initiateResidents {

    for (int i = 0; i < countryModel.numberOfResidents; i ++) {
        Emigrant *newResident = [[Emigrant new] initWithRandomParameters];
        ResidentItem *newResidentItem = [[ResidentItem new] initWithEmData:newResident];

        [countryModel.residentSet addRecord:newResidentItem];
    }
}

- (void)moveEmigrantFrom:(NSMutableSet<BoundaryStorageItem*>*)fromPlace
           moveItToPlace:(NSMutableSet<BoundaryStorageItem*>*)toPlace {


    
}


@end
