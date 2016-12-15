//
//  AlertMenuC.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "AlertMenuC.h"
#import "MainListTableVC.h"

@interface AlertMenuC () {
    UIViewController *viewControllerToPresent;
}

@end

@implementation AlertMenuC 
    
- (instancetype)initWithOwnerVC:(UIViewController *)viewController {
    self = [super init];

    if (self) {
        viewControllerToPresent = viewController;
    }
    return  self;
}

- (void)initAlertControllerForList {

    //type cast to my controller
    MainListTableVC *viewController = ((MainListTableVC *)viewControllerToPresent);

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sort list by"
                                                                   message:nil//@"You are using UIAlertController"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *first = [UIAlertAction actionWithTitle:@"date creation"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
                                                    [viewController sortListByDate];
                                                    [alert dismissViewControllerAnimated:YES completion:nil]; //^(void){[VC sortListByDate];}
                                                  }];
    UIAlertAction *second = [UIAlertAction actionWithTitle:@"ABC (title)"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                        [viewController sortListByTitle];
                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleCancel 
                                                   handler:^(UIAlertAction *action) {
                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];


    [alert addAction:first];
    [alert addAction:second];
    [alert addAction:cancel];

    [viewControllerToPresent presentViewController:alert animated:YES completion:nil];
}

@end
