//
//  StringCategories.h
//  CharSwapInString
//
//  Created by Nikolay Dementiev on 16.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef StringCategories_h
#define StringCategories_h


@interface NSString(SwapChars)

-(NSString *)removeSymbolWithCount:(int)counter;
-(NSString *)swapSymbolsWithCount:(int)counter
                    symbolForSwap:(NSString *)symbolSwap;


@end

#endif /* StringCategories_h */
