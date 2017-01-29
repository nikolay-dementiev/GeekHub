//
//  LineView.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 27.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineView : UIView

- (instancetype)initWithCoordinate:(CGPoint)pointFrom
                                  pointTo:(CGPoint)pointTo;
- (void)setPoint:(CGPoint)pointFrom
         pointTo:(CGPoint)pointTo;

@end
