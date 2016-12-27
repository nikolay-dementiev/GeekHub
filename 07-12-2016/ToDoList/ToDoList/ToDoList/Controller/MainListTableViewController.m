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
#import "MainSlideMenuViewController.h"
#import "MainToDoListGesture.h"

@interface MainListTableViewController () {

    NSString *listCellIdentifier;

}

- (IBAction)sortMenu:(UIBarButtonItem *)sender;
- (IBAction)leftMenuShow:(UIBarButtonItem *)sender;

@property (nonatomic, strong, readwrite) NSMutableArray<TaskModel *> *tasklist;
@property (nonatomic, strong) MainSlideMenuViewController *slideMenuVC;
@property (nonatomic, strong) AlertMenuController *alertMenuVC;

@end

@implementation MainListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    listCellIdentifier = @"TaskListCell";
    self.tasklist = [NSMutableArray new];

    //test!!
    [self insertTestsDadaIntoTableList];
    [self setupGestures];
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
    self.alertMenuVC = [[AlertMenuController alloc] initWithOwnerViewController:self];

    [self.alertMenuVC  showAlertMenu:^(BOOL finished) {
        if (finished) {
            self.alertMenuVC = nil;
        }
    }];
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

#pragma mark - slide menu

- (void)destroySlideMenuViewController {
    self.slideMenuVC = nil;
}

- (IBAction)leftMenuShow:(UIBarButtonItem *)sender {
    [self showOrHideSlideMenu];
}

- (void)showOrHideSlideMenu {
    if (!self.slideMenuVC) {
        self.slideMenuVC = [MainSlideMenuViewController setupMenuView: self];
    }
    [self.slideMenuVC showOrHideMenu];
}

@end
