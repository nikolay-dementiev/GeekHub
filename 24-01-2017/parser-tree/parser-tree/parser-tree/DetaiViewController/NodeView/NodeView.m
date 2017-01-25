//
//  NodeView.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://stackoverflow.com/a/4055353/6643923    

#import "NodeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation NodeView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.layer.cornerRadius = 30;
    self.layer.masksToBounds = YES;

    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 3.0f;

    self.layer.backgroundColor = [UIColor orangeColor].CGColor;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
