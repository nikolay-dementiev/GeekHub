//
//  GraphWork.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 29.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

@class Node;

@protocol GraphWorkDelegate <NSObject>
@required

- (void)showNodeTreev3:(nonnull Node *)node
              completion:(void (^ __nullable)(BOOL finished))callBack;

@end
