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

@interface DetailViewController ()

//@property (nonatomic, retain) UIView IBOutlet *myNodeViewFromNib;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    NodeView *newNodeView = [NodeView loadFromNib:@"NodeView" classToLoad: [NodeView class]];
//    newNodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), newNodeView.center.y);
//    newNodeView.frame = CGRectOffset( newNodeView.frame, 0, 70);
//    [self.view addSubview: newNodeView];

//    [self drawNode:10 xOffset:0 yOffset:70];
//    [self drawNode:2 xOffset:-40 yOffset:70*2];
//    [self drawNode:5 xOffset:+40 yOffset:70*2];
//    [self drawNode:40 xOffset:-80 yOffset:70*3];

    [self showNodeTreev3: self.nodes];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)showNodeTreev3: (Node *)node
{

    NSMutableString *result = [NSMutableString new];
    NSMutableArray *queue   = [NSMutableArray new];
    [queue enqueue:node];
    [queue enqueue:[NSNull null]];

    int depth = 1;

    while (true){
        Node *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]) {
            [result appendString:@"\n"];

            depth++;
            //DRAW ARROW

            if ([queue count] == 0) {
                break;
            }
            [queue addObject:[NSNull null]];
            continue;
        }

//        [result appendString: [NSString stringWithFormat:@" (%i)", curObject.data]];
        //DRAW NODE
        [self drawNode:curObject.data xOffset:0 yOffset:70*depth];

        for (int i = 0; i < [curObject.nodesArray count]; i++) {
            Node *nodeItem = [curObject.nodesArray objectAtIndex: i];

            [queue enqueue:nodeItem];
        }
    }
    
    return result;
}

- (void)drawNode:(int)nodeData
         xOffset:(int)xOffsetFromCenter
         yOffset:(int)yOffsetFromCenter{
    NodeView *newNodeView = [NodeView loadFromNib:@"NodeView" classToLoad: [NodeView class]];

    newNodeView.nodeDataLabel.text = [NSString stringWithFormat:@"%i", nodeData];

    newNodeView.center = CGPointMake(CGRectGetMidX(self.view.bounds), newNodeView.center.y);
    newNodeView.frame = CGRectOffset(newNodeView.frame, xOffsetFromCenter, yOffsetFromCenter);

    [self.view addSubview: newNodeView];
}

@end
