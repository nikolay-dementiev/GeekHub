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

@interface WeatherAPI()

extern NSString *const imageURl;
extern NSString *const weatherCurrentDataURl;
extern NSString *const keyURl;

@end

@implementation WeatherAPI

NSString *const imageURl = @"http://openweathermap.org/img/w/%@.png";
NSString *const weatherCurrentDataURl = @"http://api.openweathermap.org/data/2.5/weather?q=%@&mode=json&units=metric&appid=%@";
NSString *const keyURl = @"75a5517a18cff77cd854cb3c594b1681";

+ (NSDictionary *)getWeatherData:(NSString *)countryName
                       withError:(NSError **)errorPtr{

    // потрібно повиносити в константи урлу і ключ
    /*ответ: переделал*/
    NSString *urlString = [NSString
                           stringWithFormat:weatherCurrentDataURl,
                           countryName,
                           keyURl];

    NSString *query = urlString;

    NSURL *URL = [NSURL URLWithString:query];
    NSData *jsonData = [[NSString stringWithContentsOfURL:URL
                                                 encoding:NSUTF8StringEncoding
                                                    error:nil]
                        dataUsingEncoding:NSUTF8StringEncoding];
    //    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization
                                        JSONObjectWithData:jsonData
                                        options:0
                                        error:errorPtr] : nil;

    // що буде, коли повернеться помилка?
    /*ответ: переделал: добивал параметр ЕРРОР - и его обоработку извне*/
    return results;
}

+ (NSData *)getImageDataForWeatheIco:(NSString *)weatherIcoId
                           withError:(NSError **)errorPtr {

    //http://openweathermap.org/weather-conditions

    // урлу в константи
    /*ответ: переделал*/
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:
                          [NSString stringWithFormat:imageURl, weatherIcoId]
                          ]];
    return imageData;
}

+ (NSString *)showCurrentInfoFromJSON:(NSDictionary *)jsonDictData {

    // краще розділяти створення обєкта і виклик методу, тоді коди чистіший
    /*ответ: согласен - но в данном случае - это метод инициалиции
     - ну покрайне мере должен быть таким ..*/
    CurrentWeatherInfo *newInfoItem = [[CurrentWeatherInfo new] initWithData:jsonDictData];

    return [newInfoItem showObjectDescription];
}


@end
