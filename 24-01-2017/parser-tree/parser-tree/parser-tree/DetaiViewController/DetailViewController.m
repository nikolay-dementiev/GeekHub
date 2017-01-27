//
//  DetailViewController.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://stackoverflow.com/a/3191405/6643923

#import "DetailViewController.h"
#import "NSObject+LoadFromNib.h"
#import "NodeView.h"
#import "Node.h"
#import "NSMutableArray_Additions.h"
#import "NodeDecorator.h"
#import "LineView.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
//@property (strong, nonatomic) LineView *lineView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self drawNode:10 xOffset:0 yOffset:70];
//    [self drawNode:2 xOffset:-40 yOffset:70*2];
//    [self drawNode:5 xOffset:+40 yOffset:70*2];
//    [self drawNode:40 xOffset:-80 yOffset:70*3];


    self.scrollView = [[UIScrollView alloc] initWithFrame:
                       CGRectMake(0, 0,
                                  self.view.frame.size.width,
                                  self.view.frame.size.height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*1.1,
                                             self.view.frame.size.height);

//    self.lineView = [[LineView alloc] initWithFrame:self.scrollView.bounds];

    //[self testConnectViews];
    [self showNodeTreev3: self.nodes];


    [self.view addSubview:self.scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)showNodeTreev3:(Node *)node
{

    NSMutableArray *queue   = [NSMutableArray new];

    int widthHeigth = [self widthHeigthOfNodeView];
    int localYOffset = widthHeigth;
    NodeDecorator *rootNodeDecorator = [[NodeDecorator alloc]initWithNode:node
                                                            rootDecorator:nil
                                                                  xOffset:0
                                                                  yOffset:localYOffset];
    [queue enqueue:rootNodeDecorator];
    [queue enqueue:[NSNull null]];

    int depth = 1;

    while (true){
        NodeDecorator *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]) {
            //[result appendString:@"\n"];

            depth++;

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

        //Calculate LEAFS
        int countInarray = (int)[curObject.nodesArray count];
        int curOffsetToRight = curObject.curOffsetToRight; // get from root

        //int *ip = &curOffsetToRight;
        for (int i = 0; i < countInarray; i++) {
            Node *nodeItem = [curObject.nodesArray objectAtIndex: i];
            int xOffset = [self calculateXOffset:i
                                 countsOfIterate:(countInarray-1)
                                     rootXOffset:curObject.xOffset
                                 curOffsetToRight:&curOffsetToRight];

            NodeDecorator *leafNodeDecorator = [[NodeDecorator alloc]initWithNode:nodeItem
                                                                    rootDecorator:curObject
                                                                          xOffset:xOffset
                                                                          yOffset:localYOffset];
            [queue enqueue:leafNodeDecorator];
        }
        curObject.curOffsetToRight = curOffsetToRight;
    }
}

- (int)calculateXOffset:(int)currentIterator
        countsOfIterate:(int)countsOfIterate
            rootXOffset:(int)rootXOffset
        //curOffsetToLeft:(int)curIteratorOffsetToLeft
        curOffsetToRight:(int *)curOffsetToRight {

    int valueForReturn = 0;

    int widthHeigth = [self widthHeigthOfNodeView];
//    int rootXPos = abs(rootXOffset);
//    int curIterator = currentIterator > 0 ? currentIterator : 1;

    int pointer = countsOfIterate/2;

    if (countsOfIterate/2 == currentIterator) { //center, nonbinary number of elements
        int centerOffsetAngle = rootXOffset;
        valueForReturn = centerOffsetAngle + *curOffsetToRight;
    } else if (currentIterator < pointer) {
        //move left
        int leftOffsetAngle = (widthHeigth * -1 + rootXOffset);
        valueForReturn =  leftOffsetAngle + *curOffsetToRight;

    } else if (currentIterator >= pointer) {
        //move right
        valueForReturn = widthHeigth + rootXOffset + *curOffsetToRight; //* curIteratorOffsetToRight
        *curOffsetToRight = *curOffsetToRight + valueForReturn;
    }

    return valueForReturn;
}

- (int)widthHeigthOfNodeView {
    return 70;
}

- (NodeView *)drawNode:(int)nodeData
         xOffset:(int)xOffsetFromCenter
         yOffset:(int)yOffsetFromCenter{
    NodeView *newNodeView = [NodeView loadFromNib:@"NodeView" classToLoad: [NodeView class]];

    newNodeView.nodeDataLabel.text = [NSString stringWithFormat:@"%i", nodeData];

    newNodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), newNodeView.center.y);
    newNodeView.frame = CGRectOffset(newNodeView.frame, xOffsetFromCenter, yOffsetFromCenter);

    [self.scrollView addSubview: newNodeView];

    return newNodeView;
}

//- (void)testConnectViews {
//
//    NodeView *view1 = [self drawNode:10 xOffset:0 yOffset:70];
//    NodeView *view2 = [self drawNode:2 xOffset:-40 yOffset:70*2];
//
//
//    [self drawArrrowConnectTheViews:view1 viewLeaf:view2];
//
//}

- (void)drawArrrowConnectTheViews:(UIView *)viewA
               viewLeaf:(UIView *)viewB
{

    if (!viewA || !viewB) {
        return;
    }

    CGPoint p1, p2;
    CGRect frame;
    frame = [viewA frame];
    p1 = CGPointMake(CGRectGetMidX(frame), CGRectGetMaxY(frame));
    frame = [viewB frame];
    p2 = CGPointMake(CGRectGetMidX(frame), CGRectGetMinY(frame));
//    // Convert them to coordinate system of the scrollview
//    p1 = [self.scrollView convertPoint:p1 fromView:viewA];
//    p2 = [self.scrollView convertPoint:p2 fromView:viewB];

    LineView *lineView = [[LineView alloc] initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    self.scrollView.contentSize.width,
                                                                    self.scrollView.contentSize.height)];//CGRectMake(0,0,400,400)//self.scrollView.bounds


//    // And now into coordinate system of target view.
//    p1 = [self.scrollView convertPoint:p1 toView:lineView];
//    p2 = [self.scrollView convertPoint:p2 toView:lineView];

    // Set the points.
    [lineView setPoint:p1 pointTo:p2];

    [self.scrollView addSubview: lineView];
    [lineView setNeedsDisplay]; // If the properties don't set it already


}

@end
