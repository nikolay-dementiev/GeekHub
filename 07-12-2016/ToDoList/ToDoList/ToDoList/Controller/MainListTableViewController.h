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

@interface MainListTableViewController : UITableViewController <DetailViewControllerDelegate, SlideMenuDelegate>

- (void)sortListByTitle;
- (void)sortListByDate;

- (void)showOrHideSlideMenu;

@end
