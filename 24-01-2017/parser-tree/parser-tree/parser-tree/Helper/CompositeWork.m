//
//  CompositeWork.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "CompositeWork.h"
#import "Node.h"

@implementation CompositeWork

+ (Node *)createCompositeTree: (NSDictionary *)jsonDictionary
{
    Node *newNodeTree = [CompositeWork fullFillTree:jsonDictionary rootNode:nil];

    return newNodeTree;
}

- (Node *)createNewNode:(NSDictionary *)dict
                    key:(id)key
{
    NSInterger aValue = [[dict valueForKey:key] intValue];
    Node *newNode = [[Node alloc] initWithData:aValue];

    return newNode;
}

+ (Node *)fullFillTree:(NSDictionary *)dict
              rootNode:(Node *)node
{
    for (id key in dict) {
        id value = dict[key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            [CompositeWork fullFillTree:value rootNode:node];
        } else if([value isKindOfClass:[NSArray class]]) {
           for (NSDictionary *arrayValue in value) {
                [CompositeWork fullFillTree:arrayValue rootNode:node];
            }
        } else {
            int aValue = [[dict valueForKey:key] intValue];
            node = [CompositeWork insertNodeValue:aValue root:node];
        }
    }

    return node;
}

+ (Node *)insertNodeValue:(NSInteger)value
                     root:(Node *)root
{
    Node *node = [[Node alloc] initWithData:value];

    if (root) {
        [root insertNode:node];
    }
    
    return node;
}


@end

