//
//  NSMutableArray_Additions.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://www.svetliy.com/coding-question-print-binary-tree-by-level-in-objective-c/

#import <Foundation/Foundation.h>

@interface  NSMutableArray (QueueAdditions)
- (id)dequeue;
- (void)enqueue:(id)obj;
@end
