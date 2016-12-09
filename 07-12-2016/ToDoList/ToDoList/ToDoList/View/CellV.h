//
//  CellV.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellV : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *taskExecuted;
- (IBAction)taskExecutePressed:(UISwitch *)sender;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *dateTime;

@end
