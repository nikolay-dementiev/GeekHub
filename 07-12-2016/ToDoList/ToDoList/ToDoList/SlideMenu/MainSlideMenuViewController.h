//
//  MAinSlideMenuViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 25.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuDelegate.h"


@interface MainSlideMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,retain) NSArray *menuItems;

- (instancetype)initWithOwner:(UIViewController *)newownerViewController2;

+ (MainSlideMenuViewController *)setupMenuView:(UIViewController *)ownerViewController;

@property (nonatomic, weak) id <slideMenuDelegate> delegate;

//+ (void)setupMenuView;
- (void)showOrHideMenu;

@end
