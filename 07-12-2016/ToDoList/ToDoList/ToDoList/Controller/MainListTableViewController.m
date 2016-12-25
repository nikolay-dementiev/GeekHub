//
//  MainListTableViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "MainListTableViewController.h"
#import "ToDoItemTableViewCell.h"
#import "DetailViewController.h"
#import "TaskModel.h"
#import "AlertMenuController.h"
//#import "MenuViewController.h"
//#import "SlideMenuViewController.h"

//#import "PanelDelegate.h"
//#import "SlideMenuViewController2.h"
//
//#define CORNER_RADIUS 4
//#define SLIDE_TIMING .25
//#define PANEL_WIDTH 60
#import "SlideMenuView.h"
#import "MainSlideMenuViewController.h"

@interface MainListTableViewController ()<UIGestureRecognizerDelegate> {

    NSString *listCellIdentifier;
    AlertMenuController *alertMenuDelegat;

    UIViewController *activeViewController;
}

- (IBAction)sortMenu:(UIBarButtonItem *)sender;
- (IBAction)leftMenuShow:(UIBarButtonItem *)sender;

@property (nonatomic, strong, readwrite) NSMutableArray<TaskModel *> *tasklist;

//@property (nonatomic, assign) BOOL showPanel;
//@property (nonatomic, assign) BOOL panelMovedRight;
@property (nonatomic, assign) BOOL slideMenuShowed;
@property (nonatomic, nullable) UIView *viewForMenu;

@end

@implementation MainListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    listCellIdentifier = @"TaskListCell";
    alertMenuDelegat = [[AlertMenuController alloc] initWithOwnerViewController:self];


    self.tasklist = [NSMutableArray new];
    //test!!
    [self insertTestsDadaIntoTableList];

    //    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    //    [self setupView];
    self.slideMenuShowed = false;

}

- (void)insertTestsDadaIntoTableList {
    [self.tasklist addObject:[[TaskModel alloc] initWithData:@"4first"]];
    [self.tasklist addObject:[[TaskModel alloc] initWithData:@"3second"]];
    [self.tasklist addObject:[[TaskModel alloc] initWithData:@"1third"]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasklist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier forIndexPath:indexPath];

    TaskModel *itemInArayOfItems = [_tasklist objectAtIndex:indexPath.row];

    // Configure the cell...
    cell.itemModel = itemInArayOfItems;

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source

        [self.tasklist removeObjectAtIndex:indexPath.row];

        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    DetailViewController *destinationVC = segue.destinationViewController;
    destinationVC.delegate = self;

    if ([segue.identifier isEqualToString:@"ShowDetail"]) {

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        destinationVC.itemModel = [self.tasklist objectAtIndex:indexPath.row];
    }
}


#pragma mark - Sort List

- (IBAction)sortMenu:(UIBarButtonItem *)sender {
    [alertMenuDelegat  initAlertControllerForList];
}


- (void)sortListByTitle {
    // for detail see sorce: https://www.pmg.com/blog/3-different-ways-to-sort-a-uitableview/
    NSArray *tAray = [((NSArray *)self.tasklist) sortedArrayUsingSelector:@selector(compareTitle:)];
    [self.tasklist setArray:tAray];

    [self.tableView reloadData];
}

- (void)sortListByDate {
    // for detail see sorce: https://www.pmg.com/blog/3-different-ways-to-sort-a-uitableview/
    NSString *key = @"dateCreation";

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key
                                                                   ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedList = [self.tasklist sortedArrayUsingDescriptors:sortDescriptors];

    [self.tasklist setArray:sortedList];

    [self.tableView reloadData];
}

#pragma mark - delegate (detail view Controller)
- (void)setNewCellValueInTableViewList:(NSString *)itemModelData {

    TaskModel *newItemModel = [[TaskModel alloc] initWithData:itemModelData];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: [self.tasklist count] inSection:0];
    int index = (int)indexPath.row;

    [self.tasklist insertObject:newItemModel atIndex:index];

    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]
                          withRowAnimation:UITableViewRowAnimationRight];

    //update table
    NSArray* indexCellsForUpdate = [NSArray arrayWithObjects:indexPath, nil];
    [self.tableView reloadRowsAtIndexPaths:indexCellsForUpdate
                          withRowAnimation:UITableViewRowAnimationFade];
}

- (void)updateCurrentCellValueInTableViewList:(TaskModel *)itemModelData {
    //http://jeffreysambells.com/2013/03/01/asynchronous-operations-in-ios-with-grand-central-dispatch

    //[self.tableView beginUpdates];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int index = (int)indexPath.row;

    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
    //[self.tableView endUpdates];

    //update table
    NSArray* indexCellsForUpdate = [NSArray arrayWithObjects:indexPath, nil];
    [self.tableView reloadRowsAtIndexPaths:indexCellsForUpdate
                          withRowAnimation:UITableViewRowAnimationFade];

}

#pragma mark - menu

- (void)setupMenuView {

    CGFloat menuWidth = 300.0;
    //    self.viewForMenu = [[SlideMenuView alloc] initWithFrame:CGRectMake(-menuWidth,
    //                                                                       0,
    //                                                                       menuWidth,
    //                                                                       self.view.frame.size.height)];


    //    self.viewForMenu = [[SlideMenuView alloc] init];
    //    self.viewForMenu = [[SlideMenuView alloc] initWithFrame:CGRectMake(-self.view.frame.size.width,
    //                                                                       0,
    //                                                                       self.view.frame.size.width,
    //                                                                       self.view.frame.size.height)];

    //    self.viewForMenu.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview: self.viewForMenu];

    MainSlideMenuViewController *myViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController2"];
    //    [myViewController loadViewIfNeeded];
    [self addChildViewController:myViewController];
    //    self.viewForMenu = [myViewController view];
    myViewController.view.frame = CGRectMake(-self.view.frame.size.width,
                                             0,
                                             self.view.frame.size.width,
                                             self.view.frame.size.height);
    //    self.viewForMenu.frame = CGRectMake(-self.view.frame.size.width,
    //                                        0,
    //                                        self.view.frame.size.width,
    //                                        self.view.frame.size.height);
    self.viewForMenu = myViewController.view;
    [self.view addSubview:self.viewForMenu];


    //    // Setup the table view.
    //    self.viewForTable = [[UITableView alloc] initWithFrame:self.viewForMenu.bounds
    //                                                     style:UITableViewStylePlain];
    //    self.viewForTable.backgroundColor = [UIColor blueColor];
    //    self.viewForTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //    self.viewForTable.scrollEnabled = NO;
    //    self.viewForTable.alpha = 1.0;
    //
    //    self.viewForTable.delegate = self;
    //    self.viewForTable.dataSource = self;
    //
    //    [self.viewForMenu addSubview:self.viewForTable];

}

-(void)showMenu{

    //slide the content view to the right to reveal the menu
    [UIView animateWithDuration:.4
                     animations:^{

                         [self.viewForMenu setFrame:CGRectMake(self.viewForMenu.frame.origin.x,
                                                               self.viewForMenu.frame.origin.y,
                                                               self.viewForMenu.frame.size.width + 200,
                                                               self.viewForMenu.frame.size.height)];
                         [self.view layoutIfNeeded];
                         //CGRectOffset( aView.frame, 10, 10 );
                     }
                     completion:^(BOOL finished) {
                         if (finished)  {
                             self.slideMenuShowed = TRUE;
                         }
                     }
     ];

}

-(void)hideMenu{

    //slide the content view to the left to hide the menu
    [UIView animateWithDuration:.25
                     animations:^{

                         [self.viewForMenu setFrame:CGRectMake(self.viewForMenu.frame.origin.x,
                                                               self.viewForMenu.frame.origin.y,
                                                               self.viewForMenu.frame.size.width - 200,
                                                               self.viewForMenu.frame.size.height)];
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         if (finished)  {
                             [self.viewForMenu removeFromSuperview];
                             self.slideMenuShowed = FALSE;
                         }
                     }
     ];
}



- (IBAction)leftMenuShow:(UIBarButtonItem *)sender {
    if (!self.slideMenuShowed) {
        [self setupMenuView];

        //expandMenu
        //        [UIView beginAnimations:nil context:nil];
        //        [UIView setAnimationDuration:0.75];
        //        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        //        CGRect frame= self.viewForMenu.frame;
        //        frame.size.width+=200;
        //        self.viewForMenu.frame=frame;
        //
        //        [UIView commitAnimations];
        [self showMenu];

        //        self.slideMenuShowed = TRUE;

    } else {
        //collapseMenu
        //        [UIView beginAnimations:nil context:nil];
        //        [UIView setAnimationDuration:0.75];
        //        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        //        CGRect frame=self.viewForMenu.frame;
        //        frame.size.width-=200;
        //        self.viewForMenu.frame=frame;
        //
        //        [self.viewForMenu removeFromSuperview];
        //        [UIView commitAnimations];

        [self hideMenu];


        //        self.slideMenuShowed = FALSE;
    }





    //    SlideMenuViewController *menuViewController = [[SlideMenuViewController alloc] initWithOwner: self.view];
    //
    //    menuViewController.view.frame = CGRectMake(self.view.frame.size.width - 200, 0, self.view.frame.size.width, self.view.frame.size.height);
    //
    //    [self.view addSubview:menuViewController.view];
    //    [self addChildViewController:menuViewController];
    //
    //    [menuViewController didMoveToParentViewController:self];
    //
    ////    [self showActiveViewWithShadow:YES withOffset:-2];
    //
    //    [menuViewController showMenuDown];



    //////    MenuViewController *menuViewController = [self.storyboard
    //////                                              instantiateViewControllerWithIdentifier:@"menuViewController"];
    //    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    //
    //    menuViewController.menuItems = @[@"Close",
    //                                     @"Second View",
    //                                     @"Menu Item 3",
    //                                     @"Menu Item 4",
    //                                     @"Menu Item 5",
    //                                     @"Menu Item 6"];
    //
    //    menuViewController.mainView = self.view;
    //
    //    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //    menuViewController.animator = self.animator;
    //
    //    [menuViewController setupMenuView];
    //    [menuViewController showMenu:YES];
    //
    //
    ////    menuViewController.mainView = self.view;
    ////
    ////    [self presentViewController:menuViewController
    ////                       animated:YES
    ////                     completion:^(){
    ////                         [menuViewController showMenu:YES];
    ////                     }];
    //
    ////    [menuViewController setupMenuView];
    ////    [menuViewController showMenu:YES];
    ////    [self setupMenuView];
    ////    [self showMenu:YES];
    
}

@end
