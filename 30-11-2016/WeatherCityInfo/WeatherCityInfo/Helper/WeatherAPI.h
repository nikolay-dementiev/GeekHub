//
//  WeatherAPI.h
//  WeatheAPIInfo
//
//  Created by Nikolay Dementiev on 23.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef WeatherAPI_h
#define WeatherAPI_h

@interface WeatherAPI : NSObject

+ (NSDictionary *)getWeatherData:(NSString *)countryName;
+ (NSString *)showCurrentInfoFromJSON:(NSDictionary *)jsonDictData;
+ (NSData *)getImageDataForWeatheIco:(NSString *)weatherIcoId;

@end

#endif /* WeatherAPI_h */
