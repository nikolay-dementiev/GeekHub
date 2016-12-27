//
//  MainListTableViewController+MainToDoListGesture.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 27.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "MainToDoListGesture.h"

@implementation MainListTableViewController (MainToDoListGesture)

#pragma mark -
#pragma mark UIGestureRecognizerDelegate methods

- (void)setupGestures {
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(movePanel:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];

    [self.view addGestureRecognizer:panRecognizer];
}

// This is where we can slide the active panel from left to right and back again,
// endlessly, for great fun!
- (void)movePanel:(id)sender {
    [[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];

    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        [self showOrHideSlideMenu];
    }
}

@end
