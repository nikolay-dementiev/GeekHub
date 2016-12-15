//
//  DetailViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskModel;

// краще називати повною назвою DetailViewController
/*-> ok*/

@protocol DetailVCDelegate <NSObject>
@required
- (void)setNewCellValueInList:(NSString *)itemModelData;
- (void)updateCurrentCellValueInList:(TaskModel *)itemModelData;
@end


@interface DetailViewController : UIViewController

//http://stackoverflow.com/questions/5210535/passing-data-between-view-controllers
@property (nonatomic, weak) id <DetailVCDelegate> delegate;

@property (readwrite, nonatomic, weak) TaskModel *itemModel;
//@property (readwrite, nonatomic, weak) NSString *operationCode;

- (void) fullFillDetailItem;

@end
