//
//  MenuViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 24.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,retain) NSArray *menuItems;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (nonatomic, strong) UIView *viewForMenu;
@property (nonatomic, strong) UITableView *viewForTable;
@property (nonatomic, strong) UIDynamicAnimator *animator;

- (void)setupMenuView;
- (void)showMenu:(BOOL)yesNo;

@end
