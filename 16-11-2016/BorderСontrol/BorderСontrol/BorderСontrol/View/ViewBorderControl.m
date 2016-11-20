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

@implementation ViewBorderControl

+ (void)initiateBorderControlGame {

    Country *usaCountry = [[Country new] initWithName: @"USA"];
    Country *mexicoCountry = [[Country new] initWithName: @"Mexico"];

    NSArray *countryArray = [NSArray arrayWithObjects: usaCountry, mexicoCountry, nil];

    //1. enter numberOfResidents
    float num;
    for (int i = 0; i<2; i++) {
        Country *processCountry = countryArray[i];
        num = 0;
        NSLog(@"1.%d Please, Enter number of residents in: '%@' country",
              i,
              processCountry.name);
        scanf("%f",&num);

        processCountry.numberOfResidents = num;
    }

    //2.
    
    
}

@end
