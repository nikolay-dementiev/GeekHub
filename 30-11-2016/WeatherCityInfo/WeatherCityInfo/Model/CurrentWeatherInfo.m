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

    _coordLon = dictData[@"coord"][@"lon"];
    _coordLat = dictData[@"coord"][@"lat"];
    _mainTemp = dictData[@"main"][@"temp"];
    _mainPressure = dictData[@"main"][@"pressure"];
    _mainHumidity = dictData[@"main"][@"humidity"];
    _mainTemp_max = dictData[@"main"][@"temp_max"];
    _mainTemp_min = dictData[@"main"][@"temp_min"];
    _windSpeed = dictData[@"wind"][@"speed"];
    _cityName = dictData[@"name"];
    _cityId = dictData[@"id"];
    _sysCountry = dictData[@"sys"][@"country"];
    _weatherIcon = dictData[@"weather"][0][@"icon"];
}

- (NSString *)showObjectDescription {
    NSMutableString *descriptions =  [[NSMutableString alloc] init];

    [descriptions appendFormat: @"City name: '%@'\n", _cityName];
    [descriptions appendFormat: @"Country code: '%@'\n", _sysCountry];
    [descriptions appendFormat: @"City ID: '%@'\n", _cityId];
    [descriptions appendFormat: @"City geo location, longitude: '%@'\n", _coordLon];
    [descriptions appendFormat: @"City geo location, latitude: '%@'\n", _coordLat];
    [descriptions appendFormat: @"Temp. (Celsius): '%.1f'\n", [_mainTemp doubleValue]];
    [descriptions appendFormat: @"Atmospheric pressure, hPa : '%@'\n", _mainPressure];
    [descriptions appendFormat: @"Humidity, %%: '%@'\n", _mainHumidity];
    [descriptions appendFormat: @"Max. temp. at the moment: '%.1f'\n", [_mainTemp_max doubleValue]];
    [descriptions appendFormat: @"Min. temp. at the moment: '%.1f'\n", [_mainTemp_min doubleValue]];
    [descriptions appendFormat: @"Wind speed. (meter/sec): '%.1f'\n", [_windSpeed doubleValue]];
    [descriptions appendFormat: @"Weather icon id: '%@'\n", _weatherIcon];

    return descriptions;
}

@end
