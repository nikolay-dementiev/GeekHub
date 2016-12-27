//
//  AlertMenuController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "AlertMenuController.h"
#import "MainListTableViewController.h"

@interface AlertMenuController () {
    UIViewController *viewControllerToPresent;
}

@end

@implementation AlertMenuController 


- (void)eraseAllLinksFromSuperVC {
    viewControllerToPresent = nil;
}

- (instancetype)initWithOwnerViewController:(UIViewController *)viewController {
    self = [super init];

    if (self) {
        viewControllerToPresent = viewController;
    }
    return  self;
}

- (void)showAlertMenu:(void (^ __nullable)(BOOL finished))callBack {

    //type cast to my controller
    MainListTableViewController *viewController = ((MainListTableViewController *)viewControllerToPresent);

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sort list by"
                                                                   message:nil//@"You are using UIAlertController"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *first = [UIAlertAction actionWithTitle:@"date creation"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
                                                    [viewController sortListByDate];
                                                    [alert dismissViewControllerAnimated:YES completion:nil];

                                                      callBack(true);
                                                      [self eraseAllLinksFromSuperVC];
                                                  }];
    UIAlertAction *second = [UIAlertAction actionWithTitle:@"ABC (title)"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                        [viewController sortListByTitle];
                                                        [alert dismissViewControllerAnimated:YES completion:nil];

                                                       callBack(true);
                                                       [self eraseAllLinksFromSuperVC];
                                                   }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleCancel 
                                                   handler:^(UIAlertAction *action) {
                                                        [alert dismissViewControllerAnimated:YES completion:nil];

                                                       callBack(true);
                                                       [self eraseAllLinksFromSuperVC];
                                                   }];


    [alert addAction:first];
    [alert addAction:second];
    [alert addAction:cancel];

    [viewControllerToPresent presentViewController:alert animated:YES completion:nil];
}

@end
