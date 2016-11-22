//
//  ViewBorderControl.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBorderControl.h"

@implementation ViewBorderControl

- (int)setNumberOfResident:(NSString *)processCountryName {

    //1. enter numberOfResidents
    float num;
    num = 0;
    NSLog(@"Please, enter number of residents in '%@' country:",
          processCountryName);

    //!!!!!
    scanf("%f",&num);
    //num = 30; // for test only!!!!

    return num;
}

- (void)showLogOfProgramWork:(NSString *)stringLog {
    NSLog(@"Result of program work is: \n%@", stringLog);
}

@end
