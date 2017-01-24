//
//  Composite.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "Composite.h"


@implementation Composite

- (instancetype)initWithData:(NSNumber *)data;
{
    self = [super init];
    if (self) {
//        embeddedArray = [[[NSMutableArray alloc ]ini:[self zone]] init];
        //initWithData

        self.dataOfObject = data;
    }
    return self;
}


- (instancetype)initWithObjectData:(Composite *)objecData {
    self = [super init];

    if(self != nil)
    {
        Composite *square = [[Composite alloc] initWithData: [NSNumber numberWithInt:2]];
        if (square == nil)
        {
            return nil;
        }
    }

    return self;
}

@end
