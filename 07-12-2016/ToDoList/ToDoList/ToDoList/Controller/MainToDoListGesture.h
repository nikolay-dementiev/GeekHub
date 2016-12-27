//
//  MainListTableViewController+MainToDoListGesture.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 27.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "MainListTableViewController.h"

@interface MainListTableViewController (MainToDoListGesture) <UIGestureRecognizerDelegate>

- (void)setupGestures;

@end
