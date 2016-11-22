//
//  ViewBorderControlController.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 22.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef ViewBorderControlController_h
#define ViewBorderControlController_h
#import "ViewBorderControl.h"

@interface ViewBorderControlController : NSObject {
    ViewBorderControl *viewOfProgmam;
}

+ (instancetype)sharedInstance;

- (void)initiateBorderControlGame;
- (instancetype)init;



@end

#endif /* ViewBorderControlController_h */
