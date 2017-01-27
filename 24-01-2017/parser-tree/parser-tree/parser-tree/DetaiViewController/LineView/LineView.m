//
//  LineView.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 27.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://stackoverflow.com/a/5848077/6643923

#import "LineView.h"
#import "UIBezierPath+dqd_arrowhead.h"

@interface LineView()

@property (readwrite, nonatomic) CGPoint pointFrom;
@property (readwrite, nonatomic) CGPoint pointTo;

@end

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
    }
    
    return self;
}

- (instancetype)initWithCoordinate:(CGPoint)pointFrom
                                  pointTo:(CGPoint)pointTo {
    self = [super init];

    if (self) {
        [self setPoint:pointFrom pointTo:pointTo];
    }

    return self;
}

- (void)setPoint:(CGPoint)pointFrom
         pointTo:(CGPoint)pointTo {

    self.pointFrom = pointFrom;
    self.pointTo = pointTo;
}


- (void)drawRect:(CGRect)rect
{
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    // Set up color, line width, etc. first.
//    [path moveToPoint: self.pointFrom];
//    [path addLineToPoint: self.pointTo];
//    [path stroke];
//    //2
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(10.0, 10.0)];
//    [path addLineToPoint:CGPointMake(100.0, 100.0)];
//    path.lineWidth = 3;
//    [[UIColor blueColor] setStroke];
//    [path stroke];

//        UIBezierPath *path = [UIBezierPath bezierPath];
//        // Set up color, line width, etc. first.
//        [path moveToPoint: self.pointFrom];
//        [path addLineToPoint: self.pointTo];
//        [path stroke];
//        path.lineWidth = 3;
//        [[UIColor blueColor] setStroke];
//        [path stroke];


    //https://i.stack.imgur.com/jfb4u.png
    UIColor *colorOfArrow = [UIColor redColor];

    [colorOfArrow setStroke];
    [colorOfArrow setFill];
    CGFloat tailWidth = 0;
    CGFloat headWidth = 8;
    CGFloat headLength = 8;
    UIBezierPath *path = [UIBezierPath dqd_bezierPathWithArrowFromPoint:(CGPoint)self.pointFrom
                                                  toPoint:(CGPoint)self.pointTo
                                                tailWidth:(CGFloat)tailWidth
                                                headWidth:(CGFloat)headWidth
                                               headLength:(CGFloat)headLength];
    [path setLineWidth:2.0];
    [path stroke];
    [path fill];

}

@end
