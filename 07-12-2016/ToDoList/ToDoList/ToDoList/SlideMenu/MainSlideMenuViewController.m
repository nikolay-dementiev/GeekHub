//
//  MAinSlideMenuViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 25.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "MainSlideMenuViewController.h"
#import "UIColor+UIColorCategory.h"

@interface MainSlideMenuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *closeMenu;

@property (nonatomic, assign) BOOL slideMenuShowed;
@property (weak, nonatomic) IBOutlet UIView *ownerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *closeMenuButton;

@property (strong, nonatomic) NSMutableDictionary *customColorScene;

@end

@implementation MainSlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self initColorScene];

    self.menuItems = @[@"Close",
                       @"ToDo list",
                       @"Info"];
}

- (void) initColorScene {

    //http://colorhunt.co/c/44243
    self.customColorScene = [NSMutableDictionary new];
    [self.customColorScene setValue:[UIColor colorFromHexString:@"#D2F6FC" alpha:1]
                             forKey:@"viewBackgroundColor"];
    [self.customColorScene setValue:[UIColor colorFromHexString:@"#A9D2FF" alpha:0.8]
                             forKey:@"activeCellBackgroundColor"];
    [self.customColorScene setValue:[UIColor colorFromHexString:@"#6730EC" alpha:1]
                             forKey:@"cellTextColor"];
    [self.customColorScene setValue:[UIColor colorFromHexString:@"#7984EE" alpha:1]
                             forKey:@"closeMenuButtonColor"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view.

    UIColor *viewBackgroundColor = [self.customColorScene valueForKey:@"viewBackgroundColor"];
    self.view.backgroundColor = viewBackgroundColor;
    self.tableView.backgroundColor = viewBackgroundColor;

    [self.closeMenuButton
     setTitleColor:[self.customColorScene valueForKey:@"closeMenuButtonColor"]
     forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithOwner:(UIView *)owner {
    self = [super init];

    if (self) {
        self.ownerView = owner;
    }

    return self;
}

#pragma mark - UITableView Delegate and Datasource method implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    [self customizingCellColor:cell];

    NSString *menuOptionText = self.menuItems[indexPath.row];
    cell.textLabel.text = menuOptionText;
    cell.textLabel.textAlignment = NSTextAlignmentRight;

    return cell;
}

- (void)customizingCellColor:(UITableViewCell *)cell {
    cell.contentView.backgroundColor = [self.customColorScene valueForKey:@"viewBackgroundColor"];

    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [self.customColorScene valueForKey:@"activeCellBackgroundColor"];
    [cell setSelectedBackgroundView:bgColorView];

    cell.textLabel.textColor = [self.customColorScene valueForKey:@"cellTextColor"];
}

#pragma mark - menu actions

+ (MainSlideMenuViewController *)setupMenuView:(UIViewController *)ownerViewController {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainSlideMenuViewController *newSlideViewController = [sb
                                                           instantiateViewControllerWithIdentifier:@"MenuViewController2"];

    //    MainSlideMenuViewController *newSlideViewController = [[MainSlideMenuViewController alloc]
    //                                                     initWithOwner:ownerViewController.view];


    [ownerViewController addChildViewController:newSlideViewController];

    newSlideViewController.view.frame = CGRectMake(- newSlideViewController.ownerView.frame.size.width,
                                                   0,
                                                   newSlideViewController.ownerView.frame.size.width,
                                                   newSlideViewController.ownerView.frame.size.height);

    //    self.viewForMenu = myViewController.view;
    [newSlideViewController.ownerView addSubview:newSlideViewController.view];

    return newSlideViewController;
}


- (void)showOrHideMenu {

    if (!self.slideMenuShowed) {
        //        [self setupMenuView];

        [self showMenu];

    } else {

        [self hideMenu];
    }

}

- (void)showMenu {

    //slide the content view to the right to reveal the menu
    [UIView animateWithDuration:.4
                     animations:^{

                         [self.view setFrame:CGRectMake(self.view.frame.origin.x,
                                                        self.view.frame.origin.y,
                                                        self.view.frame.size.width + 200,
                                                        self.view.frame.size.height)];
                         [self.ownerView layoutIfNeeded];
                         //CGRectOffset( aView.frame, 10, 10 );
                     }
                     completion:^(BOOL finished) {
                         if (finished)  {
                             self.slideMenuShowed = TRUE;
                         }
                     }
     ];

}

- (void)hideMenu {

    //slide the content view to the left to hide the menu
    [UIView animateWithDuration:.25
                     animations:^{

                         [self.view setFrame:CGRectMake(self.view.frame.origin.x,
                                                        self.view.frame.origin.y,
                                                        self.view.frame.size.width - 200,
                                                        self.view.frame.size.height)];
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         if (finished)  {
                             [self.view removeFromSuperview];
                             self.slideMenuShowed = FALSE;
                         }
                     }
     ];
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - Some Error handling!
//- (void)setValue:(id)value forKeyPath:(NSString *)keyPath {
//    [super setValue:value forKeyPath:keyPath];
//}
//
//- (void)setValue:(id)value forKey:(NSString *)key {
//    [super setValue:value forKeyPath:key];
//}

@end
