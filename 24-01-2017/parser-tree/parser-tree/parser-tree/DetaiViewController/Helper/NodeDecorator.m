//
//  NodeDecorator.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 26.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//https://github.com/ochococo/Design-Patterns-In-Swift#-decorator


#import "NodeDecorator.h"
#import "Node.h"

@interface NodeDecorator()

@property (readwrite, strong, nonatomic) Node *decoratedNode;
@end


@implementation NodeDecorator

- (instancetype)initWithNode:(Node *)decorNode
               rootDecorator:(NodeDecorator *)rootNodeDecorator
                     xOffset:(int)xOffset
                     yOffset:(int)yOffset  {

    self = [super init];

    if (self) {
        self.decoratedNode = decorNode;

        self.xOffset = xOffset;
        self.yOffset = yOffset;

        self.rootNodeDecorator = rootNodeDecorator;
    }

    return self;
}

- (int)data {
    return self.decoratedNode.data;
}

- (NSMutableArray *)nodesArray {
    return self.decoratedNode.nodesArray;
}

@end
