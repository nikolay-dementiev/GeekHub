//
//  MenuViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 24.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//
//https://www.devfright.com/uikitdynamics-sliding-menu/

#import "MenuViewController.h"
#define menuWidth 300.0

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *menuView;
- (IBAction)closeMunuPressed:(UIButton *)sender;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //    [self setupMenuView];
    //    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {

}

#pragma mark - UITableView Delegate and Datasource method implementation

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    NSString *menuOptionText = self.menuItems[indexPath.row];
    cell.textLabel.text = menuOptionText;
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Futura" size:15.0];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;

    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];

    if (indexPath.row == 0) {
        [self showMenu:NO];

        [UIView animateWithDuration:1.3 animations:^{

            //            self.menuButton.alpha=1;
            //            self.blurView.alpha=0;

        }];


    }else if (indexPath.row == 1) {

        // code here to do something else
        //        [self performSegueWithIdentifier:@"to2" sender:nil];

    }else if (indexPath.row == 2) {
        [self closeMenu];
        // code here to do something else

    }else if (indexPath.row == 3) {

        // code here to do something else

    }else if (indexPath.row == 4) {

        // code here to do something else

    }else if (indexPath.row == 5) {


    }

}

#pragma mark - menu actions
- (void)setupMenuView {
    [self loadViewIfNeeded];
    //        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];


//    self.viewForMenu = [[UIView alloc] initWithFrame:CGRectMake(-menuWidth,
//                                                                0,
//                                                                menuWidth,
//                                                                self.mainView.frame.size.height)];


    self.viewForMenu = [self.menuView initWithFrame:CGRectMake(-menuWidth,
                                                                0,
                                                                menuWidth,
                                                                self.mainView.frame.size.height)];
    self.viewForMenu = self.menuView;

    self.viewForMenu.backgroundColor = [UIColor yellowColor];
    [self.mainView addSubview:self.viewForMenu];

    // Setup the table view.
    self.viewForTable = [[UITableView alloc] initWithFrame:self.viewForMenu.bounds
                                                     style:UITableViewStylePlain];
    self.viewForTable.backgroundColor = [UIColor blueColor];
    self.viewForTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.viewForTable.scrollEnabled = NO;
    self.viewForTable.alpha = 1.0;

    self.viewForTable.delegate = self;
    self.viewForTable.dataSource = self;

    [self.viewForMenu addSubview:self.viewForTable];

}

- (void)closeMenu {
    [self.viewForTable removeFromSuperview];
    [self.viewForMenu removeFromSuperview];
}

-(void)showMenu:(BOOL)yesNo {
    [self.animator removeAllBehaviors];
    // set some values  open YES is the left value -- open NO is the right value
    // when then menu is told to toggle open, the values on the left of
    // "yesNo" acts on the gravity, boundry point, and bounce
    CGFloat gravityDirectionX = (yesNo) ? 0.3 : -1.0;
    CGFloat boundaryPointX = (yesNo) ? menuWidth : -menuWidth;
    CGFloat bounceAmount = (yesNo) ? .4 : .3;

    //instantiate a behavior ******* GRAVITY *******
    //how much gravity is acting on our object and from what direction?
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.viewForMenu]];
    gravityBehavior.gravityDirection = CGVectorMake(gravityDirectionX, 0.0);
    //add the behavior
    [self.animator addBehavior:gravityBehavior];

    //instantiate a behavior ******* COLLISION *******
    //what do we collide with?
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.viewForMenu]];
    [collisionBehavior addBoundaryWithIdentifier:@"menuBoundary"
                                       fromPoint:CGPointMake(boundaryPointX, 580)
                                         toPoint:CGPointMake(boundaryPointX, 0)];
    [self.animator addBehavior:collisionBehavior];

    //instantiate a behavior item ******* ELASTICITY *******
    // what is the bounce factor when it collides with the boundry?
    UIDynamicItemBehavior *menuViewBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.viewForMenu]];
    menuViewBehavior.elasticity = bounceAmount;
    [self.animator addBehavior:menuViewBehavior];

}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)closeMunuPressed:(UIButton *)sender {

    [self closeMenu];
}
@end
