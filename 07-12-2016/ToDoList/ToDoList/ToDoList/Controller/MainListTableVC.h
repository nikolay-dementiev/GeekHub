//
//  MainListTableVCTableViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskModel;

@interface MainListTableVC : UITableViewController

@property (nonatomic, strong, readwrite) NSMutableArray<TaskModel *> *tasklist;
- (void)sortListByTitle;
- (void)sortListByDate;

@end
