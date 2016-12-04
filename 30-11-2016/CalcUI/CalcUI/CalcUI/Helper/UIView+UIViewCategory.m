//
//  UIView+UIViewCategory.m
//  CalcUI
//
//  Created by Nikolay Dementiev on 04.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "UIView+UIViewCategory.h"

@implementation UIView (UIViewCategory)

@dynamic borderColor,borderWidth,cornerRadius;

- (void)setBorderColor:(UIColor *)borderColor {
    [self.layer setBorderColor:borderColor.CGColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    [self.layer setBorderWidth:borderWidth];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    [self.layer setCornerRadius:cornerRadius];
}

@end
