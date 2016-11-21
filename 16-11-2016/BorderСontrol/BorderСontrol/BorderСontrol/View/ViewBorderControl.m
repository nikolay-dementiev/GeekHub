//
//  ViewBorderControl.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBorderControl.h"
#import "Country.h"
#import "CountryController.h"

@implementation ViewBorderControl

+ (void)initiateBorderControlGame {



    //    Country *usaCountry = [[Country new] initWithName: @"USA"];
    CountryController *usaCountryController = [[CountryController new] initWithModelName: @"USA"];

    //    Country *mexicoCountry = [[Country new] initWithName: @"Mexico"];
    CountryController *mexicoCountryController = [[CountryController new] initWithModelName: @"Mexico"];

    NSArray *countryControllerArray = [NSArray arrayWithObjects: usaCountryController,
                                       mexicoCountryController,
                                       nil];


    //1. enter numberOfResidents
    float num;
    for (int i = 0; i<2; i++) {
        CountryController *processCountryController = countryControllerArray[i];
        num = 0;
        NSLog(@"1.%d Please, Enter number of residents in '%@' country:",
              i,
              processCountryController.nameOfModelCountry);
        //!!!!! scanf("%f",&num);
        num = 30; // for test only!!!!


        [processCountryController setNumberOfResidents:num];
    }

    //2.
    for (CountryController *controller in countryControllerArray) {
        [controller initiateResidents];
    }

    
}

@end
