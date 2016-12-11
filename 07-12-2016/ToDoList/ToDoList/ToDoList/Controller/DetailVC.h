//
//  DetailVC.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskModel;

@interface DetailVC : UIViewController

@property (readwrite, nonatomic, weak) TaskModel* itemModel;
- (void) fullFillDetailItem;

@end
