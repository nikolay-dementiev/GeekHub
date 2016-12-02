//
//  WeatherAPI.m
//  WeatheAPIInfo
//
//  Created by Nikolay Dementiev on 23.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherAPI.h"
#import "CurrentWeatherInfo.h"

@implementation WeatherAPI

+ (NSDictionary *)getWeatherData:(NSString *)countryName {

    NSString *urlString = [NSString
                           stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&mode=json&units=metric&appid=%@",
                           countryName,
                           @"75a5517a18cff77cd854cb3c594b1681"];

    NSString *query = urlString;

    NSURL *URL = [NSURL URLWithString:query];
    NSData *jsonData = [[NSString stringWithContentsOfURL:URL
                                                 encoding:NSUTF8StringEncoding
                                                    error:nil]
                        dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization
                                        JSONObjectWithData:jsonData
                                        options:0
                                        error:&error] : nil;

    return results;
}

+ (NSData *)getImageDataForWeatheIco:(NSString *)weatherIcoId {

    //http://openweathermap.org/weather-conditions

    NSData *imageData = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:
                         [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weatherIcoId]
                          ]];
    return imageData;
}

+ (NSString *)showCurrentInfoFromJSON:(NSDictionary *)jsonDictData {

    CurrentWeatherInfo *newInfoItem = [[CurrentWeatherInfo new] initWithData:jsonDictData];

    return [newInfoItem showObjectDescription];
}


@end
