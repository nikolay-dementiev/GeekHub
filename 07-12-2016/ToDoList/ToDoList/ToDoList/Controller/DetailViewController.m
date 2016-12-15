//
//  DetailViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "DetailViewController.h"
#import "TaskModel.h"
//#import "MainListTableVC.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *taskExecuted;
@property (weak, nonatomic) IBOutlet UITextField *titleDetail;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;

- (IBAction)saveButtokPressed:(UIBarButtonItem *)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self fullFillDetailItem];
    [self showTitleOfNavBar];

}

- (void)fullFillDetailItem {
    [self.taskExecuted setOn:self.itemModel.executed animated:NO];
    self.titleDetail.text = self.itemModel.title;
    self.dateTime.text = [self.itemModel.dateCreation description];
}

- (void)showTitleOfNavBar {
    if (nil == self.itemModel) {
        self.title = @"Create new item";
    } else {
        self.title = [NSString stringWithFormat:@"Edit '%@'", self.itemModel.title];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if (self.itemModel) {
//        //update current one
//        self.itemModel.title = self.titleDetail.text;
//        //[self performSegueWithIdentifier:@"unwindToListVCWithCurrentObj" sender:self];
//        //         self.operationCode = @"unwindToListVCWithCurrentObj";
//    } else {
//        //create new one
//        [self.delegate setNewCellValueInList:self.titleDetail.text];
//        //         self.itemModel = [[TaskModel new] initWithData:self.titleDetail.text];
//
//        //[self performSegueWithIdentifier:@"unwindToListVCWithNewObj" sender:self];
//        //         self.operationCode = @"unwindToListVCWithNewObj";
//    }
}

- (IBAction)saveButtokPressed:(UIBarButtonItem *)sender {

    if (self.itemModel) {
        self.itemModel.title = self.titleDetail.text;
        [self.delegate updateCurrentCellValueInList:self.itemModel];
    } else {
        [self.delegate setNewCellValueInList:self.titleDetail.text];
    }

    [[self navigationController] popViewControllerAnimated:YES];
}

@end
