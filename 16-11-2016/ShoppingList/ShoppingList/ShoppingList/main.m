//
//  main.m
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingList.h"
#import "ShoppingListItem.h"
#import "JsonWork.h"


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

        //save to Json
        NSError *error = nil;
        BOOL overwriteFile = false;//overwrite = false - its means: file will be fully new every time
        [shoppingListMain saveListToJson:overwriteFile withError:&error];
        if (error) {
            NSLog(@"Error saving data to Json: %@",error);
        } else {
            NSLog(@"The data were successfully saved in Json!");
        }

        //Print result
        NSLog(@"\n1. Print data of the program: \n");
        for (int i = 0; i < [sortedList count]; i++) {
            ShoppingListItem *itenInList = sortedList[i];
            NSLog(@"Iten in list#%i: name: '%@', date: '%@', cheked: '%hhd'",
                  i,
                  itenInList.name,
                  itenInList.date,
                  itenInList.checked);
        }
        NSLog(@"\n2. Print json data: \n");

        error = nil;
        NSString *savedJsonData = [JsonWork loadJsonFromFile:&error];
        if (error) {
            NSLog(@"Error to load Json data from file: %@",error);
        }
        NSLog(@"Print loaded from file Json data: \n%@",savedJsonData);
        
    }
    return 0;
}
