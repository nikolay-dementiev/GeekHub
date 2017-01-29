//
//  DetailViewController.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://stackoverflow.com/a/3191405/6643923

#import "DetailViewController.h"
//#import "NSObject+LoadFromNib.h"
//#import "NodeView.h"
//#import "Node.h"
//#import "NSMutableArray_Additions.h"
//#import "NodeDecorator.h"
//#import "LineView.h"
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
    //[self showNodeTreev3: self.nodes];
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

//- (void)showNodeTreev3:(Node *)node
//{
//
//    NSMutableArray *queue = [NSMutableArray new];
//    NSMutableDictionary *queueDepth = [NSMutableDictionary new];
//
//    NSInteger depth = 0;
//    [queueDepth setObject:[NSNumber numberWithInteger:0]
//                   forKey:[NSNumber numberWithInteger:depth]];
//
//    NSInteger widthHeigth = [self widthHeigthOfNodeView];
//    NSInteger localYOffset = widthHeigth;
//
//    NodeDecorator *rootNodeDecorator = [[NodeDecorator alloc]initWithNode:node
//                                                            rootDecorator:nil
//                                                                  xOffset:0
//                                                                  yOffset:localYOffset
//                                                             currentDepth:depth];
//    [queue enqueue:rootNodeDecorator];
//    [queue enqueue:[NSNull null]];
//
//    depth++;
//    [queueDepth setObject:[NSNumber numberWithInteger:0]
//                   forKey:[NSNumber numberWithInteger:depth]];
//
//    while (true) {
//        NodeDecorator *curObject = [queue dequeue];
//        if ([curObject isEqual:[NSNull null]]) {
//
//            depth++;
//            [queueDepth setObject:[NSNumber numberWithInteger:0]
//                           forKey:[NSNumber numberWithInteger:depth]];
//
//            if ([queue count] == 0) {
//                break;
//            }
//            [queue addObject:[NSNull null]];
//            continue;
//        }
//
//        //DRAW NODE
//        NodeView *leafNode = [self drawNode:curObject.data
//                                    xOffset: curObject.xOffset
//                                    yOffset:curObject.yOffset * depth];
//        curObject.nodeView = leafNode;
//
//        //DRAW ARROW beenween nodes
//        [self drawArrrowConnectTheViews:curObject.rootNodeDecorator.nodeView
//                               viewLeaf:leafNode];
//
//        //Calculate LEAFs
//        NSInteger countInarray = [curObject.nodesArray count];
//        NSInteger curOffsetToRight = [[queueDepth objectForKey:
//                                       [NSNumber numberWithInteger:depth]]
//                                      integerValue];
//
//        for (int i = 0; i < countInarray; i++) {
//            Node *nodeItem = [curObject.nodesArray objectAtIndex: i];
//
//            NSInteger xOffset = [self calculateXOffset:i
//                                       countsOfIterate:(countInarray-1)
//                                           rootXOffset:curObject.xOffset
//                                      curOffsetToRight:&curOffsetToRight];
//
//            NodeDecorator *leafNodeDecorator = [[NodeDecorator alloc]initWithNode:nodeItem
//                                                                    rootDecorator:curObject
//                                                                          xOffset:xOffset
//                                                                          yOffset:localYOffset
//                                                                     currentDepth:depth];
//            [queue enqueue:leafNodeDecorator];
//        }
//        [queueDepth setObject:[NSNumber numberWithInteger:curOffsetToRight]
//                       forKey:[NSNumber numberWithInteger:depth]];
//    }
//}
//
//- (NSInteger)calculateXOffset:(int)currentIterator
//              countsOfIterate:(NSInteger)countsOfIterate
//                  rootXOffset:(NSInteger)rootXOffset
//             curOffsetToRight:(NSInteger *)curOffsetToRight
//{
//
//    NSInteger valueForReturn = 0;
//    NSInteger widthHeigth = [self widthHeigthOfNodeView];
//    NSInteger pointer = countsOfIterate/2;
//
//    if (countsOfIterate/2 == currentIterator) { //center, nonbinary number of elements
//        NSInteger centerOffsetAngle = rootXOffset;
//        valueForReturn = centerOffsetAngle + *curOffsetToRight;
//    } else if (currentIterator < pointer) {
//        //move left
//        NSInteger leftOffsetAngle = (widthHeigth * -1 + rootXOffset);
//        valueForReturn =  leftOffsetAngle + *curOffsetToRight;
//
//    } else if (currentIterator >= pointer) {
//        //move right
//        valueForReturn = widthHeigth + rootXOffset + *curOffsetToRight;
//        *curOffsetToRight = *curOffsetToRight + ABS(valueForReturn);
//    }
//
//    return valueForReturn;
//}
//
//- (NSInteger)widthHeigthOfNodeView
//{
//    return 70;
//}
//
//- (NodeView *)drawNode:(NSInteger)nodeData
//               xOffset:(NSInteger)xOffsetFromCenter
//               yOffset:(NSInteger)yOffsetFromCenter
//{
//    NodeView *newNodeView = [NodeView loadFromNib:@"NodeView" classToLoad: [NodeView class]];
//
//    newNodeView.nodeDataLabel.text = [NSString stringWithFormat:@"%i", (int)nodeData];
//
//    newNodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), newNodeView.center.y);
//    newNodeView.frame = CGRectOffset(newNodeView.frame, xOffsetFromCenter, yOffsetFromCenter);
//
//    [self.scrollView addSubview: newNodeView];
//
//    return newNodeView;
//}
//
//- (void)drawArrrowConnectTheViews:(UIView *)viewA
//                         viewLeaf:(UIView *)viewB
//{
//
//    if (!viewA || !viewB) {
//        return;
//    }
//
//    CGPoint p1, p2;
//    CGRect frame;
//    frame = [viewA frame];
//    p1 = CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame));
//    frame = [viewB frame];
//    p2 = CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame));
//    //    // Convert them to coordinate system of the scrollview
//    //    p1 = [self.scrollView convertPoint:p1 fromView:viewA];
//    //    p2 = [self.scrollView convertPoint:p2 fromView:viewB];
//
//    LineView *lineView = [[LineView alloc] initWithFrame:CGRectMake(0,
//                                                                    0,
//                                                                    self.scrollView.contentSize.width,
//                                                                    self.scrollView.contentSize.height)];//CGRectMake(0,0,400,400)//self.scrollView.bounds
//
//
//    //    // And now into coordinate system of target view.
//    //    p1 = [self.scrollView convertPoint:p1 toView:lineView];
//    //    p2 = [self.scrollView convertPoint:p2 toView:lineView];
//
//    // Set the points.
//    [lineView setPoint:p1 pointTo:p2];
//
//    [self.scrollView addSubview: lineView];
//    [lineView setNeedsDisplay]; // If the properties don't set it already
//
//
//}

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




