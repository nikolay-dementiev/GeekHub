//
//  ToDoItemTableViewCell.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "ToDoItemTableViewCell.h"
#import "TaskModel.h"

@interface ToDoItemTableViewCell()

@property (weak, nonatomic) IBOutlet UISwitch *taskExecuted;
- (IBAction)taskExecutePressed:(UISwitch *)sender;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;

@end

@implementation ToDoItemTableViewCell

- (IBAction)taskExecutePressed:(UISwitch *)sender {
    self.itemModel.executed = sender.isOn;
}

- (void)setItemModel:(TaskModel *)itemModel
{
    _itemModel = itemModel;

    [self.taskExecuted setOn:self.itemModel.executed animated:NO];
    self.title.text = self.itemModel.title;
    self.dateTime.text = [self.itemModel.dateCreation description];
}

@end
