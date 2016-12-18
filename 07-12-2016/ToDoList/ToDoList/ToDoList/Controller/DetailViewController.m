//
//  DetailViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "DetailViewController.h"
#import "TaskModel.h"

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

    [self fullFillDetailViewControllerFromItemModel];
    [self showTitleOfNavBar];
}

- (void) fullFillDetailViewControllerFromItemModel {
    if (self.itemModel) {
        [self.taskExecuted setOn:self.itemModel.executed animated:NO];
        self.titleDetail.text = self.itemModel.title;
        self.dateTime.text = [self.itemModel.dateCreation description];
    }
}

- (void)showTitleOfNavBar {
    if (nil == self.itemModel) {
        self.title = @"Create new item";
    } else {
        self.title = [NSString stringWithFormat:@"Edit '%@'", self.itemModel.title];
    }
}

#pragma mark - Navigation

- (IBAction)saveButtokPressed:(UIBarButtonItem *)sender {

    if (self.itemModel) {
        self.itemModel.title = self.titleDetail.text;

        if (self.delegate && [self.delegate respondsToSelector:@selector(updateCurrentCellValueInTableViewList:)]) {
            [self.delegate updateCurrentCellValueInTableViewList:self.itemModel];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(setNewCellValueInTableViewList:)]) {
            [self.delegate setNewCellValueInTableViewList:self.titleDetail.text];
        }
    }

    [[self navigationController] popViewControllerAnimated:YES];
}

@end
