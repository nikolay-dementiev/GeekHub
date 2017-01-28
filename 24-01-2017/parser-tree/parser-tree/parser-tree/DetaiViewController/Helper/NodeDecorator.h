//
//  NodeDecorator.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 26.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeView.h"
@class Node;

@interface NodeDecorator : NSObject

@property (nonatomic) NSInteger xOffset;
@property (nonatomic) NSInteger yOffset;
@property (nonatomic) NSInteger data;
@property (strong, nonatomic) NSMutableArray<Node *> *nodesArray;

@property (strong, nonatomic) NodeDecorator *rootNodeDecorator;
@property (strong, nonatomic) NodeView *nodeView;

@property (nonatomic) NSInteger curOffsetToRight;
@property (nonatomic) NSInteger embeddingDepth;

- (instancetype)initWithNode:(Node *)decorNode
               rootDecorator:(NodeDecorator *)rootNodeDecorator
                     xOffset:(NSInteger)xOffset
                     yOffset:(NSInteger)yOffset
                currentDepth:(NSInteger)embeddingDepth;

@end
