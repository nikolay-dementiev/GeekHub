//
//  CurrentWeatherInfo.m
//  WeatheAPIInfo
//
//  Created by Nikolay Dementiev on 23.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrentWeatherInfo.h"

@implementation CurrentWeatherInfo

- (instancetype)initWithData:(NSDictionary *)dictData {
    [self refillObject:dictData];

    return self;
}

- (void)refillObject:(NSDictionary *)dictData {

    self.coordLon = dictData[@"coord"][@"lon"];
    self.coordLat = dictData[@"coord"][@"lat"];
    self.mainTemp = dictData[@"main"][@"temp"];
    self.mainPressure = dictData[@"main"][@"pressure"];
    self.mainHumidity = dictData[@"main"][@"humidity"];
    self.mainTemp_max = dictData[@"main"][@"temp_max"];
    self.mainTemp_min = dictData[@"main"][@"temp_min"];
    self.windSpeed = dictData[@"wind"][@"speed"];
    self.cityName = dictData[@"name"];
    self.cityId = dictData[@"id"];
    self.sysCountry = dictData[@"sys"][@"country"];
    self.weatherIcon = dictData[@"weather"][0][@"icon"];
}

- (NSString *)showObjectDescription {
    NSMutableString *descriptions =  [[NSMutableString alloc] init];

    [descriptions appendFormat: @"City name: '%@'\n", self.cityName];
    [descriptions appendFormat: @"Country code: '%@'\n", self.sysCountry];
    [descriptions appendFormat: @"City ID: '%@'\n", self.cityId];
    [descriptions appendFormat: @"City geo location, longitude: '%@'\n", self.coordLon];
    [descriptions appendFormat: @"City geo location, latitude: '%@'\n", self.coordLat];
    [descriptions appendFormat: @"Temp. (Celsius): '%.1f'\n", [self.mainTemp doubleValue]];
    [descriptions appendFormat: @"Atmospheric pressure, hPa : '%@'\n", self.mainPressure];
    [descriptions appendFormat: @"Humidity, %%: '%@'\n", self.mainHumidity];
    [descriptions appendFormat: @"Max. temp. at the moment: '%.1f'\n", [self.mainTemp_max doubleValue]];
    [descriptions appendFormat: @"Min. temp. at the moment: '%.1f'\n", [self.mainTemp_min doubleValue]];
    [descriptions appendFormat: @"Wind speed. (meter/sec): '%.1f'\n", [self.windSpeed doubleValue]];
    [descriptions appendFormat: @"Weather icon id: '%@'\n", self.weatherIcon];

    return descriptions;
}

@end
