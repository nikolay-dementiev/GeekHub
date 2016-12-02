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
    CurrentWeatherInfo *currentInfo;
    __weak IBOutlet UIActivityIndicatorView *activIndicator;
    dispatch_queue_t loadWeatherQueue;
    UIImage *defaultImage;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageViewData;
@property (weak, nonatomic) IBOutlet UITextView *textFieldData;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentInfo = [CurrentWeatherInfo new];

    activIndicator.hidesWhenStopped = true;
    defaultImage = [self getDefaultImage];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)updateWeatherInfo:(NSString*)currentCity {

    //http://jeffreysambells.com/2013/03/01/asynchronous-operations-in-ios-with-grand-central-dispatch

    self.title = ([currentCity length] > 0) ? currentCity : @"no city was entered";
    [self setdefaultTemporaryInfo];

    loadWeatherQueue = dispatch_queue_create("Weather Queue",NULL);
    dispatch_async(loadWeatherQueue, ^{
        [activIndicator startAnimating];

        // Perform long running process

        NSDictionary *dictDataFromURL = [WeatherAPI getWeatherData:currentCity];
        NSMutableDictionary *dictOfRepresentData = [NSMutableDictionary new];

        if (dictDataFromURL != nil) {

            [currentInfo refillObject:dictDataFromURL];

            NSString *currentInfoT = [currentInfo showObjectDescription];

            UIImage *weatherImageT = [UIImage imageWithData:
                                      [WeatherAPI getImageDataForWeatheIco:currentInfo.weatherIcon]
                                      ];

            [dictOfRepresentData setValue:currentInfoT forKey:@"currentInfoT"];
            [dictOfRepresentData setValue:weatherImageT forKey:@"weatherImageT"];
        } else {

            [dictOfRepresentData setValue:@"<no data found>" forKey:@"currentInfoT"];
            [dictOfRepresentData setValue:defaultImage forKey:@"weatherImageT"];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI

            _textFieldData.text = dictOfRepresentData[@"currentInfoT"];
            _imageViewData.image = dictOfRepresentData[@"weatherImageT"];

            [activIndicator stopAnimating];
        });
    });
}

- (void)setdefaultTemporaryInfo {

    _textFieldData.text = @"<receiving data..>";
    _imageViewData.image = defaultImage;
}

- (UIImage *)getDefaultImage {
    return [UIImage imageNamed:@"unknownWeatherStatus"];
}

@end
