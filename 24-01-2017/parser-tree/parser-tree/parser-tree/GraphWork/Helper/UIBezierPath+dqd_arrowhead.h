//
//  UIBezierPath+dqd_arrowhead.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 27.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (dqd_arrowhead)

+ (UIBezierPath *)dqd_bezierPathWithArrowFromPoint:(CGPoint)startPoint
                                           toPoint:(CGPoint)endPoint
                                         tailWidth:(CGFloat)tailWidth
                                         headWidth:(CGFloat)headWidth
                                        headLength:(CGFloat)headLength;

@end
