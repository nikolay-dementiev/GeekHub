//
//  DetailViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TaskModel;

@protocol DetailViewControllerDelegate <NSObject>
@required
- (void)setNewCellValueInTableViewList:(nonnull NSString *)itemModelData;
- (void)updateCurrentCellValueInTableViewList:(nonnull TaskModel *)itemModelData;
@end


@interface DetailViewController : UIViewController

//http://stackoverflow.com/questions/5210535/passing-data-between-view-controllers
@property (nonatomic, weak, nullable) id <DetailViewControllerDelegate> delegate;
@property (readwrite, nonatomic, nullable, weak) TaskModel *itemModel;

- (void) fullFillDetailViewControllerFromItemModel;

@end
