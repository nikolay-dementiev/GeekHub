//
//  Tree.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "Tree.h"
#import "Node.h"

@implementation Tree {
    Node *root_;
}

- (void)insertValue:(int)value
{
    Node *node = [[Node alloc] initWithData:value];
    [self insertNode:node];
}

- (void)insertNode:(Node *)node
{
    if (root_ == nil) {
        root_ = node;
    } else {
        [root_ insertNode:node];
    }
}

@end
