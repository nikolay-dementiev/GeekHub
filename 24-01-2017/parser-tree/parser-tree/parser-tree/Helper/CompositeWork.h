//
//  CompositeWork.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

@class Node;

@interface CompositeWork : NSObject

+ (Node *)createCompositeTree:(NSDictionary *)jsonDictionary;

@end
