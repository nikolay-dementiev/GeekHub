//
//  SlideMenuViewController2.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 24.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "SlideMenuViewController2.h"

@interface SlideMenuViewController2 ()

@end

@implementation SlideMenuViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// navButton tag = 1 when created in Interface Builder
- (IBAction)navButtonClicked:(id)sender {
    UIButton *button = sender;
    switch (button.tag) {
        case 0: {
            self.navButton.tag = 1;
            [_delegate movePanelToOriginalPosition];
            break;
        }

        case 1: {
            self.navButton.tag = 0;
            [_delegate movePanelRight];
            break;
        }

        default:
            break;
    }
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
