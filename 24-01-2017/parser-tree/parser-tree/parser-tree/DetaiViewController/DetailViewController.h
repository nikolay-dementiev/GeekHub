//
//  DetailViewController.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Node;

@interface DetailViewController : UIViewController

@property (readwrite, strong, nonatomic) Node *nodes;

@end
