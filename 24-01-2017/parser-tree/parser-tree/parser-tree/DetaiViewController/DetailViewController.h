//
//  DetailViewController.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphWorkDelegate.h"
@class Node;

@interface DetailViewController : UIViewController

@property (strong, nonatomic, nonnull) Node *nodes;
@property (nonatomic, strong, nullable) id <GraphWorkDelegate> graphDelegate;

@end
