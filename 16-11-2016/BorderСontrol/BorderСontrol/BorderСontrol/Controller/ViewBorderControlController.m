//
//  ViewBorderControlController.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 22.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBorderControlController.h"
#import "ViewBorderControl.h"
#import "CountryController.h"

@implementation ViewBorderControlController

typedef NSArray <CountryController *> typeOfControllersArray;

+ (instancetype)sharedInstance
{
    static ViewBorderControlController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ViewBorderControlController alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        viewOfProgmam = [ViewBorderControl new];
    }

    return self;
}

- (void)initiateBorderControlGame {

    typeOfControllersArray *countryControllerArray  = [self getCountryControllerArray];

    int numberOfresident = 0;
    for (int i = 0; i < [countryControllerArray count]; i++) {
        CountryController *processCountryController = countryControllerArray[i];
        numberOfresident = [viewOfProgmam setNumberOfResident:[countryControllerArray[i] nameOfModelCountry]];

        processCountryController.numberOfResidentsInCountry = numberOfresident;
    }


    //2. Create Residents for country
    [self createCountryResidents:countryControllerArray];

//    //3.
//    BOOL flagF = true;
//
//    while (flagF) {
//        //1. chose country
//        int randomTickCountry = [Helper getRandomInt:(int)[countryControllerArray count] min:0];
//        CountryController *selectedCountryController = countryControllerArray [randomTickCountry];
//        //2. chose resident
//        int randomTickResident = [Helper getRandomInt:selectedCountryController.numberOfResidentsInCountry min:0];
//        //        CountryController *selectedCountry = countryControllerArray [randomTickResident];
//        
//        
//        
//    }
}

//MARK: class functions
- (void) createCountryResidents:(typeOfControllersArray*)countryControllerArray {
    for (CountryController *controller in countryControllerArray) {
        [controller initiateResidents];

        [controller.borderController initiateGuards: 20];
    }
}

- (typeOfControllersArray *) getCountryControllerArray {

    CountryController *usaCountryController = [[CountryController new] initWithModelName: @"USA"];
    CountryController *mexicoCountryController = [[CountryController new] initWithModelName: @"Mexico"];

    typeOfControllersArray *countryControllerArray = [NSArray arrayWithObjects: usaCountryController,
                                       mexicoCountryController,
                                       nil];

    return countryControllerArray;
}

@end
