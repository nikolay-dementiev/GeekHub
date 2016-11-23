//
//  CurrentWeatherInfo.h
//  WeatheAPIInfo
//
//  Created by Nikolay Dementiev on 23.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef CurrentWeatherInfo_h
#define CurrentWeatherInfo_h

@interface CurrentWeatherInfo : NSObject

@property (readwrite, strong, nonatomic) NSString *coordLon;
@property (readwrite, strong, nonatomic) NSString *coordLat;
@property (readwrite, strong, nonatomic) NSString *mainTemp;
@property (readwrite, strong, nonatomic) NSString *mainPressure;
@property (readwrite, strong, nonatomic) NSString *mainHumidity;
@property (readwrite, strong, nonatomic) NSString *mainTemp_max;
@property (readwrite, strong, nonatomic) NSString *mainTemp_min;
@property (readwrite, strong, nonatomic) NSString *windSpeed;
@property (readwrite, strong, nonatomic) NSString *cityName;
@property (readwrite, strong, nonatomic) NSString *cityId;
@property (readwrite, strong, nonatomic) NSString *sysCountry;

- (instancetype)initWithData:(NSDictionary *)dictData;
- (NSString *)showObjectDescription;

@end

#endif /* CurrentWeatherInfo_h */
