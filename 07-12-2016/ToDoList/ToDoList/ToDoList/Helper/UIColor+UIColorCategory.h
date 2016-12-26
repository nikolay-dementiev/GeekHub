//
//  UIColor+UIColorCategory.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 26.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (fromHex)

+ (UIColor *)colorFromHexString:(NSString *)hexStr
                          alpha:(CGFloat)alpha;

@end
