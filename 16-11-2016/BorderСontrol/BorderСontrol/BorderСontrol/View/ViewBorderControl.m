//
//  ViewBorderControl.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBorderControl.h"
//#import "Country.h"
//#import "CountryController.h"
//#import "Helper.h"

@implementation ViewBorderControl

- (int)setNumberOfResident:(NSString *)processCountryName {

    //1. enter numberOfResidents
    float num;
    num = 0;
    NSLog(@"Please, enter number of residents in '%@' country:",
          processCountryName);

    //!!!!! scanf("%f",&num);
    num = 30; // for test only!!!!

    return num;
}

//+ (void)initiateBorderControlGame {
//
//
//
//    //    Country *usaCountry = [[Country new] initWithName: @"USA"];
//    CountryController *usaCountryController = [[CountryController new] initWithModelName: @"USA"];
//
//    //    Country *mexicoCountry = [[Country new] initWithName: @"Mexico"];
//    CountryController *mexicoCountryController = [[CountryController new] initWithModelName: @"Mexico"];
//
//    NSArray *countryControllerArray = [NSArray arrayWithObjects: usaCountryController,
//                                       mexicoCountryController,
//                                       nil];
//
//
//    //1. enter numberOfResidents
//    float num;
//    for (int i = 0; i<2; i++) {
//        CountryController *processCountryController = countryControllerArray[i];
//        num = 0;
//        NSLog(@"1.%d Please, Enter number of residents in '%@' country:",
//              i,
//              processCountryController.nameOfModelCountry);
//        //!!!!! scanf("%f",&num);
//        num = 30; // for test only!!!!
//
//
//        processCountryController.numberOfResidentsInCountry = num;
//    }
//
//    //2. Create Residents for country
//    for (CountryController *controller in countryControllerArray) {
//        [controller initiateResidents];
//
//        [controller.borderController initiateGuards: 20];
//    }
//
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
//
//    
//}

@end
