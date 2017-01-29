//
//  GraphWork.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 29.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://stackoverflow.com/a/3191405/6643923

#import "GraphWork.h"
#import "NSObject+LoadFromNib.h"
#import "NodeView.h"
#import "Node.h"
#import "NSMutableArray_Additions.h"
#import "NodeDecorator.h"
#import "LineView.h"

const NSInteger widthHeigthOfNodeView = 75;

@interface GraphWork()

@property (weak, nonatomic) UIScrollView *scrollView;

@end

@implementation GraphWork

- (null_unspecified instancetype)initWithData:(nonnull UIScrollView *)rootView
{
    self = [super init];

    if (nil != self) {
        self.scrollView = rootView;
    }

    return self;
}

- (void)deInit
{
    self.scrollView = nil;
}


#pragma mark - GraphWorkDelegate

- (void)showNodeTreev3:(nonnull Node *)node
            completion:(void (^ __nullable)(BOOL finished))callBack
{

    [self showNodeTreev3:node];

    [self deInit];

    callBack(true);
}

- (void)showNodeTreev3:(nonnull Node *)node
{

    NSMutableArray *queue = [NSMutableArray new];
    NSMutableDictionary *queueDepth = [NSMutableDictionary new];

    NSInteger depth = 0;
    [queueDepth setObject:[NSNumber numberWithInteger:0]
                   forKey:[NSNumber numberWithInteger:depth]];

    NSInteger widthHeigth = widthHeigthOfNodeView;
    NSInteger localYOffset = widthHeigth;

    NodeDecorator *rootNodeDecorator = [[NodeDecorator alloc]initWithNode:node
                                                            rootDecorator:nil
                                                                  xOffset:0
                                                                  yOffset:localYOffset
                                                             currentDepth:depth];
    [queue enqueue:rootNodeDecorator];
    [queue enqueue:[NSNull null]];

    depth++;
    [queueDepth setObject:[NSNumber numberWithInteger:0]
                   forKey:[NSNumber numberWithInteger:depth]];

    while (true) {
        NodeDecorator *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]) {

            depth++;
            [queueDepth setObject:[NSNumber numberWithInteger:0]
                           forKey:[NSNumber numberWithInteger:depth]];

            if ([queue count] == 0) {
                break;
            }
            [queue addObject:[NSNull null]];
            continue;
        }

        //DRAW NODE
        NodeView *leafNode = [self drawNode:curObject.data
                                    xOffset: curObject.xOffset
                                    yOffset:curObject.yOffset * depth];
        curObject.nodeView = leafNode;

        //DRAW ARROW beenween nodes
        [self drawArrrowConnectTheViews:curObject.rootNodeDecorator.nodeView
                               viewLeaf:leafNode];

        //Calculate LEAFs
        NSInteger countInarray = [curObject.nodesArray count];
        NSInteger curOffsetToRight = [[queueDepth objectForKey:
                                       [NSNumber numberWithInteger:depth]]
                                      integerValue];

        for (int i = 0; i < countInarray; i++) {
            Node *nodeItem = [curObject.nodesArray objectAtIndex: i];

            NSInteger xOffset = [self calculateXOffset:i
                                       countsOfIterate:(countInarray-1)
                                           rootXOffset:curObject.xOffset
                                      curOffsetToRight:&curOffsetToRight];

            NodeDecorator *leafNodeDecorator = [[NodeDecorator alloc]initWithNode:nodeItem
                                                                    rootDecorator:curObject
                                                                          xOffset:xOffset
                                                                          yOffset:localYOffset
                                                                     currentDepth:depth];
            [queue enqueue:leafNodeDecorator];
        }
        [queueDepth setObject:[NSNumber numberWithInteger:curOffsetToRight]
                       forKey:[NSNumber numberWithInteger:depth]];
    }
}

- (NSInteger)calculateXOffset:(int)currentIterator
              countsOfIterate:(NSInteger)countsOfIterate
                  rootXOffset:(NSInteger)rootXOffset
             curOffsetToRight:(NSInteger *)curOffsetToRight
{

    NSInteger valueForReturn = 0;
    NSInteger widthHeigth = widthHeigthOfNodeView;
    NSInteger pointer = countsOfIterate/2;

    if (countsOfIterate/2 == currentIterator) {
        //center, nonbinary number of elements
        NSInteger centerOffsetAngle = rootXOffset;
        valueForReturn = centerOffsetAngle + *curOffsetToRight;
    } else if (currentIterator < pointer) {
        //move left
        NSInteger leftOffsetAngle = (widthHeigth * -1 + rootXOffset);
        valueForReturn =  leftOffsetAngle + *curOffsetToRight;

    } else if (currentIterator >= pointer) {
        //move right
        valueForReturn = widthHeigth + rootXOffset + *curOffsetToRight;
        *curOffsetToRight = *curOffsetToRight + ABS(valueForReturn);
    }

    return valueForReturn;
}

- (NodeView *)drawNode:(NSInteger)nodeData
               xOffset:(NSInteger)xOffsetFromCenter
               yOffset:(NSInteger)yOffsetFromCenter
{
    NodeView *newNodeView = [NodeView loadFromNib:@"NodeView" classToLoad: [NodeView class]];

    newNodeView.nodeDataLabel.text = [NSString stringWithFormat:@"%i", (int)nodeData];

    newNodeView.center = CGPointMake(CGRectGetMidX(self.scrollView.bounds), newNodeView.center.y);
    newNodeView.frame = CGRectOffset(newNodeView.frame, xOffsetFromCenter, yOffsetFromCenter);

    [self.scrollView addSubview: newNodeView];

    return newNodeView;
}

- (void)drawArrrowConnectTheViews:(UIView *)viewA
                         viewLeaf:(UIView *)viewB
{

    if (nil == viewA || nil ==viewB) {
        return;
    }
    BOOL needConvertTocoordinateSV = false; //not needed yet

    NSInteger widthHeigth = widthHeigthOfNodeView;

    CGPoint p1, p2;
    CGRect frame1, frame2;
    frame1 = [viewA frame];
    p1 = CGPointMake(CGRectGetMidX(frame1), CGRectGetMaxY(frame1));
    frame2 = [viewB frame];
    p2 = CGPointMake(CGRectGetMidX(frame2), CGRectGetMinY(frame2));

    if (needConvertTocoordinateSV) {
        // Convert them to coordinate system of the scrollview
        p1 = [self.scrollView convertPoint:p1 fromView:viewA];
        p2 = [self.scrollView convertPoint:p2 fromView:viewB];
    }

    //http://stackoverflow.com/a/17266689/6643923
    CGFloat distance = hypotf(p1.x, p2.y);

    LineView *lineView = [[LineView alloc] initWithFrame:CGRectMake(p1.x,
                                                                    p1.y,
                                                                    distance,
                                                                    widthHeigth/2)];
    lineView.frame = CGRectOffset(lineView.frame, -1 * lineView.bounds.size.width/2, 0);

    // And now into coordinate system of target view.
    p1 = [self.scrollView convertPoint:p1 toView:lineView];
    p2 = [self.scrollView convertPoint:p2 toView:lineView];

    // Set the points.
    [lineView setPoint:p1 pointTo:p2];
    
    [self.scrollView addSubview: lineView];
    [lineView setNeedsDisplay]; // If the properties don't set it already
}

@end
