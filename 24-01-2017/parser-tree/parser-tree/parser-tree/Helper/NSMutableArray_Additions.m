//
//  NSMutableArray_Additions.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "NSMutableArray_Additions.h"

@implementation  NSMutableArray (QueueAdditions)

- (id) dequeue {
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) {
        [self removeObjectAtIndex:0];
    }
    return headObject;
}

- (void) enqueue:(id)obj{
    [self addObject:obj];
}
@end
