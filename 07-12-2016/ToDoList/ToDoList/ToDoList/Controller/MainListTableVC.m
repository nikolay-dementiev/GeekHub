//
//  MainListTableVCTableViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "MainListTableVC.h"
#import "CellV.h"
#import "DetailVC.h"
#import "TaskModel.h"
#import "AlertMenuC.h"

@interface MainListTableVC ()

- (IBAction)sortMenu:(UIBarButtonItem *)sender;


@end

@implementation MainListTableVC {
    NSString *listCellIdentifier;
    AlertMenuC *alertMenuDelegat;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    listCellIdentifier = @"TaskListCell";
    alertMenuDelegat = [[[AlertMenuC alloc] init] initWithOwnerVC:self];

    //test!!
    _tasklist = [[NSMutableArray alloc] init];
    [_tasklist addObject: [[TaskModel new] initWithData:@"4first"]];
    [_tasklist addObject: [[TaskModel new] initWithData:@"3second"]];
    [_tasklist addObject: [[TaskModel new] initWithData:@"1third"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_tasklist count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellV *cell = [tableView dequeueReusableCellWithIdentifier:listCellIdentifier forIndexPath:indexPath];

    TaskModel *itemInArayOfItems = [_tasklist objectAtIndex:indexPath.row];

    // Configure the cell...
    cell.itemModel = itemInArayOfItems;
    [cell fullFillCellItem];

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

    //    UINavigationController *nav = segue.destinationViewController;
    //    DetailVC *triv = [[DetailVC alloc]init];
    //    triv = nav.viewControllers[0];
    //    triv.location = self.location;
}


- (IBAction)sortMenu:(UIBarButtonItem *)sender {

    [alertMenuDelegat  initAlertControllerForList];

}

- (void)sortListByTitle {
    // for detail see sorce: https://www.pmg.com/blog/3-different-ways-to-sort-a-uitableview/
    NSArray *tAray = [((NSArray *)_tasklist) sortedArrayUsingSelector:@selector(compareTitle:)];
    [_tasklist setArray:tAray];

    [self.tableView reloadData];
}



- (void)sortListByDate {
    // for detail see sorce: https://www.pmg.com/blog/3-different-ways-to-sort-a-uitableview/
    NSString *key = @"dateCreation";

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key
                                                                   ascending: TRUE];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedList = [_tasklist sortedArrayUsingDescriptors:sortDescriptors];
    
    [_tasklist setArray:sortedList];
    
    [self.tableView reloadData];
    
}

@end
