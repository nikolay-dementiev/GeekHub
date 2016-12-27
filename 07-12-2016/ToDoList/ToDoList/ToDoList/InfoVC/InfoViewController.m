//
//  InfoViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 27.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
- (IBAction)goBackButtonPressed:(UIButton *)sender;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBackButtonPressed:(UIButton *)sender {

    UIViewController *ToDoListViewController = [self.storyboard
                                                           instantiateViewControllerWithIdentifier:@"ToDoListVC"];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:ToDoListViewController];

    [self presentViewController:navigationController animated:TRUE completion:nil];
}
@end
