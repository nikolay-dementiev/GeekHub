//
//  main.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewBorderControlController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        [[ViewBorderControlController sharedInstance] initiateBorderControlGame];
    }
    return 0;
}
