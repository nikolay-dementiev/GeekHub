//
//  CellV.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "CellV.h"
#import "TaskModel.h"

@interface CellV()

@property (weak, nonatomic) IBOutlet UISwitch *taskExecuted;
- (IBAction)taskExecutePressed:(UISwitch *)sender;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;

@end

@implementation CellV

- (IBAction)taskExecutePressed:(UISwitch *)sender {
    self.itemModel.executed = sender.isOn;
}

- (void) fullFillCellItem {
    [self.taskExecuted setOn:self.itemModel.executed animated:NO];
    self.title.text = self.itemModel.title;
    self.dateTime.text = [self.itemModel.dateCreation description];
}

@end
