//
//  DetailVC.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskModel;

// краще називати повною назвою DetailViewController
@interface DetailVC : UIViewController

@property (readwrite, nonatomic, retain) TaskModel *itemModel;
@property (readwrite, nonatomic, weak) NSString *operationCode;

- (void) fullFillDetailItem;

@end
