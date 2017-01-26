//
//  NodeDecorator.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 26.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;

@interface NodeDecorator : NSObject

@property (readwrite, nonatomic) int xOffset;
@property (readwrite, nonatomic) int yOffset;
@property (readwrite, nonatomic) int data;
@property (readwrite, strong, nonatomic) NSMutableArray<Node *> *nodesArray;

- (instancetype)initWithNode:(Node *)decorNode
                     xOffset:(int)xOffset
                     yOffset:(int)yOffset;

@end
