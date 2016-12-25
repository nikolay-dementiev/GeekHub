//
//  PanelDelegate.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 24.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanelDelegate <NSObject>
@required
// A child panel calls these methods in its delegate when the nav button is clicked
// Which one is called depends on the tag of the navButton, which toggles each time
// it's tapped.
- (void)movePanelRight;
- (void)movePanelToOriginalPosition;

// NavigationViewController calls this method in its delegate when one of the
// coloured buttons is tapped.
- (void)didSelectViewWithName:(NSString *)viewName;

@end
