//
//  main.m
//  CharSwapInString
//
//  Created by Nikolay Dementiev on 16.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringCategories.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        //1 - видаляє через один парні символи із строки
        NSString *testString = @"Also, be sure the target membership is marked for your unit test target.";
        NSString *cutedString = [testString removeSymbolWithCount:(2)];
        NSLog(@"1.removeSymbolWithCount \n testString: '%@',\n cutedString: '%@'",testString,cutedString);

        //2 - заміняє через два символи починаючи з другого заданим в методі символом
        NSString *swappedString = [testString swapSymbolsWithCount:(3)
                                                     symbolForSwap:(@"😁")];
        NSLog(@"2.swapSymbolsWithCount \n testString: '%@',\n swappedString: '%@'",testString,swappedString);
        
    }
    return 0;
}
