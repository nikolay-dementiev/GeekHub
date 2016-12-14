//
//  DetailViewController.m
//  WeatherCityInfo
//
//  Created by Nikolay Dementiev on 30.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "CurrentWeatherInfo.h"
#import "WeatherAPI.h"

@interface DetailViewController () {
    // навіщо тут ця змінна?
    /* ответ: этот объект класса используется для перезаполнения данными -
     т.к. я не создаю каждый раз новый - а перезаполняю существующий*/

    CurrentWeatherInfo *currentInfo;

    // це поганий стайл заносити сюди аутлети
    /*ответ: перенес ниже*/
    //    __weak IBOutlet UIActivityIndicatorView *activIndicator;

    dispatch_queue_t loadWeatherQueue;

    // навіщо ця змінна?
    /* ответ: в ней хранится дефолтная картинка*/
    UIImage *defaultImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageViewData;
@property (weak, nonatomic) IBOutlet UITextView *textFieldData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activIndicator;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentInfo = [CurrentWeatherInfo new];

    self.activIndicator.hidesWhenStopped = true;
    defaultImage = [self getDefaultImage];
}

- (void)updateWeatherInfo:(NSString*)currentCity
{
    //http://jeffreysambells.com/2013/03/01/asynchronous-operations-in-ios-with-grand-central-dispatch

    self.title = ([currentCity length] > 0) ? currentCity : @"city name hasn't been entered";
    [self setdefaultTemporaryInfo];

    loadWeatherQueue = dispatch_queue_create("Weather Queue",NULL);
    dispatch_async(loadWeatherQueue, ^{
        [self.activIndicator startAnimating];

        // Perform long running process
        NSError *error = nil;

        NSDictionary *dictDataFromURL = [WeatherAPI getWeatherData:currentCity
                                                         withError:&error];
        if(error) {
            NSLog(@"Error getting weather data occurred: %@",error);
            return;
        }

        NSMutableDictionary *dictOfRepresentData = [NSMutableDictionary new];

        if (dictDataFromURL != nil) {

            [currentInfo  refillObject:dictDataFromURL];

            NSString *currentInfoT = [currentInfo showObjectDescription];

            UIImage *weatherImageT = [UIImage imageWithData:
                                      [WeatherAPI getImageDataForWeatheIco:currentInfo.weatherIcon
                                                                 withError:&error]
                                      ];
            if(error) {
                NSLog(@"Error getting weather icon occurred: %@",error);
                weatherImageT = defaultImage;
            }

            [dictOfRepresentData setValue:currentInfoT forKey:@"currentInfoT"];
            [dictOfRepresentData setValue:weatherImageT forKey:@"weatherImageT"];
        } else {

            [dictOfRepresentData setValue:@"<no data found>" forKey:@"currentInfoT"];
            [dictOfRepresentData setValue:defaultImage forKey:@"weatherImageT"];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI

            self.textFieldData.text = dictOfRepresentData[@"currentInfoT"];
            self.imageViewData.image = dictOfRepresentData[@"weatherImageT"];

            [self.activIndicator stopAnimating];
        });
    });
}

- (void)setdefaultTemporaryInfo
{
    self.textFieldData.text = @"<receiving data..>";
    self.imageViewData.image = defaultImage;
}

- (UIImage *)getDefaultImage 
{
    return [UIImage imageNamed:@"unknownWeatherStatus"];
}

@end
