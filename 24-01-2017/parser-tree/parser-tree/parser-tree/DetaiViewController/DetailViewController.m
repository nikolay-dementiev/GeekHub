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

@interface DetailViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;

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


    [self showNodeTreev3: self.nodes];

    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*1.1,
                                             self.view.frame.size.height);
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
    [queue enqueue:[[NodeDecorator alloc]initWithNode:node xOffset:0 yOffset:localYOffset]];
    [queue enqueue:[NSNull null]];

    int depth = 1;
    while (true){
        NodeDecorator *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]) {
            //[result appendString:@"\n"];

            depth++;
            //DRAW ARROW

            if ([queue count] == 0) {
                break;
            }
            [queue addObject:[NSNull null]];
            continue;
        }

        //DRAW NODE

        [self drawNode:curObject.data
               xOffset: curObject.xOffset
               yOffset:curObject.yOffset * depth];

        int countInarray = (int)[curObject.nodesArray count];
        for (int i = 0; i < countInarray; i++) {
            Node *nodeItem = [curObject.nodesArray objectAtIndex: i];
            int xOffset = [self calculateXOffset:i
                                 countsOfIterate:(countInarray-1)
                                     rootXOffset:curObject.xOffset];

            [queue enqueue:[[NodeDecorator alloc]initWithNode:nodeItem
                                                      xOffset:xOffset
                                                      yOffset:localYOffset]];
        }
    }
}

- (int)calculateXOffset:(int)currentIterator
        countsOfIterate:(int)countsOfIterate
            rootXOffset:(int)rootXOffset {

    int valueForReturn = 0;

    int widthHeigth = [self widthHeigthOfNodeView];
//    int rootXPos = abs(rootXOffset);
//    int curIterator = currentIterator > 0 ? currentIterator : 1;

    int pointer = countsOfIterate/2;

    if (countsOfIterate/2 == currentIterator) { //center, nonbinary number of elements
        valueForReturn = rootXOffset;
    } else if (currentIterator < pointer) {
        //move left
        valueForReturn = widthHeigth * -1 + rootXOffset; //curIterator *

    } else if (currentIterator >= pointer) {
        //move right
        valueForReturn = widthHeigth + rootXOffset; //* curIterator;
    }

    return valueForReturn;
}

- (int)widthHeigthOfNodeView {
    return 70;
}

- (void)drawNode:(int)nodeData
         xOffset:(int)xOffsetFromCenter
         yOffset:(int)yOffsetFromCenter{
    NodeView *newNodeView = [NodeView loadFromNib:@"NodeView" classToLoad: [NodeView class]];

    newNodeView.nodeDataLabel.text = [NSString stringWithFormat:@"%i", nodeData];

    newNodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), newNodeView.center.y);
    newNodeView.frame = CGRectOffset(newNodeView.frame, xOffsetFromCenter, yOffsetFromCenter);

    [self.scrollView addSubview: newNodeView];
}

@end
