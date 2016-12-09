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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)taskExecutePressed:(UISwitch *)sender {
    _itemModel.executed = sender.isOn;
}

- (void) fullFillCellItem {
    [_taskExecuted setOn:_itemModel.executed animated:NO];
    _title.text = _itemModel.title;
    _dateTime.text = [_itemModel.dateCreation description];
}


@end
