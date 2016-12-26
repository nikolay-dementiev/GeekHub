//
//  MainListTableViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "SlideMenuDelegate.h"

@interface MainListTableViewController : UITableViewController <DetailViewControllerDelegate, slideMenuDelegate>

- (void)sortListByTitle;
- (void)sortListByDate;


//@property (nonatomic,retain) NSArray *menuItems;
//
//@property (nonatomic, strong) UIView *viewForMenu;
//@property (nonatomic, strong) UITableView *viewForTable;
@property (nonatomic, strong) UIDynamicAnimator *animator;
//
//- (void)setupMenuView;
//- (void)showMenu:(BOOL)yesNo;

//@property (nonatomic, assign) id<slideMenuDelegate> slideMenuDelegate;



@end
