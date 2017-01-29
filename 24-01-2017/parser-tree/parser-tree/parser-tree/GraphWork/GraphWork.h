//
//  GraphWork.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 29.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GraphWorkDelegate.h"
#import "Node.h"

@interface GraphWork : NSObject<GraphWorkDelegate>

//- (void)showNodeTreev3:(nonnull Node *)node;
- (void)showNodeTreev3:(nonnull Node *)node
            completion:(void (^ __nullable)(BOOL finished))callBack;
- (null_unspecified instancetype)initWithData:(nonnull UIScrollView *)rootView;
- (void)deInit;

@end
