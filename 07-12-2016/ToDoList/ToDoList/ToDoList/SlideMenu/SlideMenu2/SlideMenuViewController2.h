//
//  SlideMenuViewController2.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 24.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PanelDelegate.h"

@interface SlideMenuViewController2 : UIViewController

@property (nonatomic, assign) id<PanelDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *navButton;

- (IBAction)navButtonClicked:(id)sender;

@end
