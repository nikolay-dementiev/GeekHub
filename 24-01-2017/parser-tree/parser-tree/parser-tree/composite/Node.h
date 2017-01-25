//
//  Node.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
// http://stackoverflow.com/questions/12066057/binary-tree-in-objective-c


#import <Foundation/Foundation.h>

@interface Node : NSObject 

@property (readwrite, nonatomic) int data;
@property (readwrite, strong, nonatomic) NSMutableArray<Node *> *nodesArray;


- (void)insertNode:(Node *)node;
- (instancetype)initWithData:(int)value;

//- (NSString *)printTreev1;
- (NSString *)printTreev2;

@end
