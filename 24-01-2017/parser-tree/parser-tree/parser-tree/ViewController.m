//
//  ViewController.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "ViewController.h"
#import "JsonWorkHelper.h"
#import "CompositeWork.h"
#import "Node.h"

@interface ViewController ()
- (IBAction)startButtonPressed:(UIButton *)sender;

@end

@implementation ViewController

- (IBAction)startButtonPressed:(UIButton *)sender
{

    NSError *error = nil;
    NSDictionary *dictDataFromURL = [JsonWorkHelper getTreeData:&error];
    if(error) {
        NSLog(@"Error getting tree data occurred: %@",error);
        return;
    }

    Node *nodeTree = [CompositeWork createCompositeTree: dictDataFromURL];
    NSString *printedNodeDatav2 = [nodeTree printTreev2];

    NSLog(@"Node tree looks like this:\n%@",printedNodeDatav2);

}


@end
