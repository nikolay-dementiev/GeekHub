//
//  ViewController.m
//  WeatherCityInfo
//
//  Created by Nikolay Dementiev on 30.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "WeatherViewController.h"
#import "DetailViewController.h"


@interface WeatherViewController () {
//    DetailViewController *nextViewController;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end


@implementation WeatherViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // навіщо ти тут створюєш контролер та ще й тримаєш лінк на нього?
    /*ответ: переделал*/
//    nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];

}


- (IBAction)submitAction {
    // я б краще писав би self.textField.text
    /*ответ: переделал*/
     DetailViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];

    [nextViewController updateWeatherInfo:self.textField.text];
    [self.navigationController pushViewController:nextViewController animated:YES];
    
}


@end
