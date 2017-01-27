//
//  NodeDecorator.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 26.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
@class NodeView;

@interface NodeDecorator : NSObject

@property (readwrite, nonatomic) int xOffset;
@property (readwrite, nonatomic) int yOffset;
@property (readwrite, nonatomic) int data;
@property (readwrite, strong, nonatomic) NSMutableArray<Node *> *nodesArray;

@property (readwrite, strong, nonatomic) NodeDecorator *rootNodeDecorator;
@property (readwrite, strong, nonatomic) NodeView *nodeView;

@property (readwrite, nonatomic) int curOffsetToRight;

- (instancetype)initWithNode:(Node *)decorNode
               rootDecorator:(NodeDecorator *)rootNodeDecorator
                     xOffset:(int)xOffset
                     yOffset:(int)yOffset;

@end
