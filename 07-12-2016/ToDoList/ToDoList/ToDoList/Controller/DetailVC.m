//
//  DetailVC.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "DetailVC.h"
#import "TaskModel.h"

@interface DetailVC ()

@property (weak, nonatomic) IBOutlet UISwitch *taskExecuted;
@property (weak, nonatomic) IBOutlet UITextField *titleDetail;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fullFillDetailItem {
    [_taskExecuted setOn:_itemModel.executed animated:NO];
    _titleDetail.text = _itemModel.title;
    _dateTime.text = [_itemModel.dateCreation description];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
