//
//  DetailViewController.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "DetailViewController.h"
#import "GraphWorkDelegate.h"
#import "GraphWork.h"

@interface DetailViewController()

@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self initScrollView];
    [self showNodeTree];
}

- (void)initScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:
                       CGRectMake(0, 0,
                                  self.view.frame.size.width,
                                  self.view.frame.size.height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*1.1,
                                             self.view.frame.size.height);
    [self.view addSubview:self.scrollView];
}

#pragma mark: - Graph work

- (void)showNodeTree
{
    self.graphDelegate = [[GraphWork alloc]initWithData:self.scrollView];

    if (self.graphDelegate && [self.graphDelegate respondsToSelector: @selector(showNodeTreev3:completion:)]) {

        [self.graphDelegate showNodeTreev3:self.nodes
                                completion:^(BOOL finished) {
                                    //all work were done successfully - let's destroy this binding
                                    self.graphDelegate = nil;
                                }];
    }
}

@end




