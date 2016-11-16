//
//  StringCategories.m
//  CharSwapInString
//
//  Created by Nikolay Dementiev on 16.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringCategories.h"

@implementation NSString(SwapChars)

- (NSString*)removeSymbolWithCount:(int)counter
{
    NSMutableString *res = [NSMutableString new];

    for (int i = 0; i < [self length]; i++)
    {
        if (i % counter == 0)
        {
            [res appendFormat:@"%c",[self characterAtIndex:i]];
        };
    };

    return res;
};

- (NSString*)swapSymbolsWithCount:(int)counter
                    symbolForSwap:(NSString*)symbolSwap
{
    NSMutableString *res = [NSMutableString new];
    int innerPoint = 1;//починаючи з другого

    for (int i = 0; i < [self length]; i++)
    {
        if ((i % counter == 0) && (i >= innerPoint))
        {
            [res appendString:symbolSwap];
        } else {
            [res appendFormat:@"%c",[self characterAtIndex:i]];
        };
    };

    return res;
};

@end
