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

//    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
//    CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
//
//    // Stop the main panel from being dragged to the left if it's not already dragged to the right
//    if ((velocity.x < 0) && (activeViewController.view.frame.origin.x == 0)) {
//        return;
//    }

    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
//        if(velocity.x > 0) {
//            _showPanel = YES;
//        }
//        else {
//            _showPanel = NO;
//        }
//
//        UIView *childView = [self getNavigationView];
//        [self.view sendSubviewToBack:childView];
    }

    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        // If we stopped dragging the panel somewhere between the left and right
        // edges of the screen, these will animate it to its final position.
//        if (!_showPanel) {
//            [self movePanelToOriginalPosition];
//            _panelMovedRight = NO;
//        } else {
//            [self movePanelRight];
//            _panelMovedRight = YES;
//        }
        [self showOrHideSlideMenu];
    }

    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
//        if(velocity.x > 0) {
//            _showPanel = YES;
//        }
//        else {
//            _showPanel = NO;
//        }
//
//        // Set the new x coord of the active panel...
//        activeViewController.view.center = CGPointMake(activeViewController.view.center.x + translatedPoint.x, activeViewController.view.center.y);
//
//        // ...and move it there
//        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0, 0) inView:self.view];
    }
}

@end
