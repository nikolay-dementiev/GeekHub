//
//  CellV.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskModel.h"

// краще назвати ToDoItemTableViewCell
@interface CellV : UITableViewCell

@property (readwrite, nonatomic, weak) TaskModel *itemModel;
- (void)fullFillCellItem;

@end
