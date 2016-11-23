//
//  main.m
//  WeatheAPIInfo
//
//  Created by Nikolay Dementiev on 23.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherAPI.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"Enter city name:");
        char cstring[40];
        scanf("%s", cstring);
        NSString *cityName = [NSString stringWithUTF8String:cstring];
        //NSString *cityName = @"Kiev"; //for test

        NSDictionary *dictDataFromURL = [WeatherAPI getWeatherData:cityName];
        NSString *logString = [WeatherAPI showCurrentInfoFromJSON:dictDataFromURL];

        NSLog(@"Weather info: \n%@", logString);
    }
    return 0;
}
