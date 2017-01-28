//
//  Node.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "Node.h"
#import "NSMutableArray_Additions.h"

@implementation Node

- (instancetype)initWithData:(NSInteger)value
{
    self = [super init];
    if (self) {
        self.data = value;
        self.nodesArray = [NSMutableArray new];
    }
    return self;
}

- (void)insertNode:(Node *)node
{
    [self.nodesArray addObject:node];
}

- (NSString *)printTreev1
{
    return [self printTreeNode:self indent:1];
}

- (NSString *)printTreeNode:(Node *)node
                     indent:(NSInteger)indent
{
    // Build indent
    NSMutableString *padding = [NSMutableString new];
    for (int i = 0; i < indent; ++i) {
        [padding appendString:@"\t"];
    }

    // Build string
    NSMutableString *string = [[NSString stringWithFormat:@"%i", (int)node.data] mutableCopy];
    for (Node *nodeLeaf in node.nodesArray) {
        [string appendString:[NSString stringWithFormat:@"\n%@%@",
                              padding, [self printTreeNode:nodeLeaf indent:indent + 1]]];
    }

    return string;
}

//http://www.svetliy.com/coding-question-print-binary-tree-by-level-in-objective-c/
- (NSString *)printTreev2
{
    Node *node = self;

    NSMutableString *result = [NSMutableString new];
    NSMutableArray *queue = [NSMutableArray new];
    [queue enqueue:node];
    [queue enqueue:[NSNull null]];

    while (true) {
        Node *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]) {
            [result appendString:@"\n"];

            if ([queue count] == 0) {
                break;
            }
            [queue addObject:[NSNull null]];
            continue;
        }

        [result appendString: [NSString stringWithFormat:@" (%i)", (int)curObject.data]];

        for (Node *nodeItem in curObject.nodesArray) {
            [queue enqueue:nodeItem];
        }
    }
    
    return result;
}


@end
