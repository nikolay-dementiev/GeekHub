//
//  main.m
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShoppingList;
@class ShoppingListItem;

#import "ShoppingList.h"
#import "ShoppingListItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        //1. create list
        ShoppingList *shoppingListMain = [ShoppingList sharedInstance];

        [shoppingListMain addNewElement: @"iron"];
        [shoppingListMain addNewElement: @"kettle"];
        [shoppingListMain addNewElement: @"pan"];

        [shoppingListMain tickCheck:0 chekItem:true];

        [shoppingListMain deleteElement:2];

        NSArray *sortedList = [shoppingListMain sortByDate];

        //Print result
        for (int i = 0; i < [sortedList count]; i++) {
            ShoppingListItem *itenInList = sortedList[i];
            NSLog(@"Iten in list#%i: name: '%@', date: '%@', cheked: '%hhd'",
                  i,
                  itenInList.name,
                  itenInList.date,
                  itenInList.checked);
        }
    }
    return 0;
}
