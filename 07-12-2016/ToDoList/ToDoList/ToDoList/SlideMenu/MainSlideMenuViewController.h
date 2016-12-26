//
//  MAinSlideMenuViewController.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 25.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainSlideMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,retain) NSArray *menuItems;

- (instancetype)initWithOwner:(UIView *)owner;

+ (MainSlideMenuViewController *)setupMenuView:(UIViewController *)ownerViewController;

//+ (void)setupMenuView;
- (void)showOrHideMenu;

@end
