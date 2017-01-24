//
//  Node.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithData:(int)value
{
    self = [super init];
    if (self) {
         self.data = value;
    }
    return self;
}

- (void)insertNode:(Node *)node
{
    if (node.data < self.data) {
        [self insertNodeOnLeftSide:node];
    } else {
        [self insertNodeOnRightSide:node];
    }
}

- (void)insertNodeOnLeftSide:(Node *)node
{
    if (self.left == nil) {
        self.left = node;
    } else {
        [self.left insertNode:node];
    }
}

- (void)insertNodeOnRightSide:(Node *)node
{
    if (self.right == nil) {
        self.right = node;
    } else {
        [self.right insertNode:node];
    }
}

@end
