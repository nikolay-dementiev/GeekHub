//
//  UIView+UIViewCategory.h
//  CalcUI
//
//  Created by Nikolay Dementiev on 04.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewCategory)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;

@end
