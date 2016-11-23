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
        // insert code here...

//        char cstring[40];
//        scanf("%s", cstring);
//        NSString *cityName = [NSString stringWithUTF8String:cstring];

       NSDictionary *dictDataFromURL =  [WeatherAPI getWeatherData:@"Kiev"];
    }
    return 0;
}
