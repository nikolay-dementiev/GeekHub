//
//  DetailVC.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "DetailVC.h"
#import "TaskModel.h"
#import "TaskModel.h"

@interface DetailVC ()

@property (weak, nonatomic) IBOutlet UISwitch *taskExecuted;
@property (weak, nonatomic) IBOutlet UITextField *titleDetail;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;
- (IBAction)saveButtokPressed:(UIBarButtonItem *)sender;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    [self fullFillDetailItem];
    [self showTitleOfNavBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fullFillDetailItem {
    [_taskExecuted setOn:_itemModel.executed animated:NO];
    _titleDetail.text = _itemModel.title;
    _dateTime.text = [_itemModel.dateCreation description];
}

- (void) showTitleOfNavBar {
    if (!self.itemModel) {
        self.title = @"Create new item";
    } else {
        self.title = [NSString stringWithFormat:@"Edit '%@'", self.itemModel.title];
    }
}

 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if (_itemModel) {
         //update current one
         _itemModel.title = _titleDetail.text;
         //[self performSegueWithIdentifier:@"unwindToListVCWithCurrentObj" sender:self];
         _operationCode = @"unwindToListVCWithCurrentObj";
     } else {
         //create new one
         _itemModel = [[TaskModel new] initWithData:_titleDetail.text];
         //[self performSegueWithIdentifier:@"unwindToListVCWithNewObj" sender:self];
         _operationCode = @"unwindToListVCWithNewObj";
     }
 }



- (IBAction)saveButtokPressed:(UIBarButtonItem *)sender {

}

@end
