//
//  BorderControlSet.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 22.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BorderControlSet.h"

@implementation BorderControlSet

- (instancetype)init {
    self = [super init];

    if (self) {
        _guardMan = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end

