//
//  SlideMenuViewController.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 24.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()
@property (strong,nonatomic) NSArray *menuItems; //array for menu

-(void)showMenu;
-(void)hideMenu;

@end

@implementation SlideMenuViewController

- (instancetype)initWithOwner:(UIView *)owner {
    self = [super init];

//    if (self) {
//        self.content = owner;
//    }

    return self;
}

//- (void)setContent:(UIView *)newContent {
//    self.content = newContent;
//
////    [self.content addSubview:self.view];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.menuItems = @[@"Close",
                                     @"Second View",
                                     @"Menu Item 3",
                                     @"Menu Item 4",
                                     @"Menu Item 5",
                                     @"Menu Item 6"];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource -

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.menuItems.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

 //   NSDictionary *menuItem = [self.menuArray objectAtIndex:indexPath.row];
//    cell.textLabel.text = menuItem[@"Title"]; /* Note , this is new objective c functionality ,
//                                               for older versions use [menuItem objectForKey:@"Title"];*/
//    cell.detailTextLabel.text = menuItem[@"Subtitle"];

    NSString *menuOptionText = self.menuItems[indexPath.row];
    cell.textLabel.text = menuOptionText;


    return cell;
}

#pragma mark - animations -
-(void)showMenu{

    //slide the content view to the right to reveal the menu
    [UIView animateWithDuration:.25
                     animations:^{

                         [self.content setFrame:CGRectMake(self.menuTable.frame.size.width,
                                                      self.content.frame.origin.y,
                                                      self.content.frame.size.width,
                                                      self.content.frame.size.height)];
                     }
     ];

}

-(void)hideMenu{

    //slide the content view to the left to hide the menu
    [UIView animateWithDuration:.25
                     animations:^{

                         [self.content setFrame:CGRectMake(0,
                                                           self.content.frame.origin.y,
                                                           self.content.frame.size.width,
                                                           self.content.frame.size.height)];
                     }
     ];
}

- (void)showMenuDown {

    if(self.content.frame.origin.x == 0) //only show the menu if it is not already shown
        [self showMenu];
    else
        [self hideMenu];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
