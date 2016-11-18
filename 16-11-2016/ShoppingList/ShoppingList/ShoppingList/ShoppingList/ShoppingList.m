//
//  ShoppingList.m
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingList.h"
#import "ShoppingListItem.h"
#import "JsonWork.h"
#import "Helper.h"

@implementation ShoppingList

+ (instancetype)sharedInstance
{
    static ShoppingList *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ShoppingList alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(instancetype)init {
    self = [super init];

    if (self) {
        savedObjects = [NSMutableSet set];
    }
    return self;
}

- (NSArray *)sortByDate {
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];

    NSArray *sortedArray = [savedObjects sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];

    return sortedArray;

}

- (void)addNewElement:(NSString *)itemName {

    ShoppingListItem *shoppingItem = [[ShoppingListItem new] initWithNameOfObject:itemName];

    [savedObjects addObject:shoppingItem];
}

- (void)deleteElement:(int)rowIndex {

    if (rowIndex < [savedObjects count]) {
        NSArray *tAarray = [savedObjects allObjects];
        ShoppingListItem *record = tAarray [rowIndex];
        [savedObjects removeObject: record];
    }
}

- (void)tickCheck:(int)rowIndex
         chekItem:(BOOL)chekIt {
    if (rowIndex < [savedObjects count]) {
        NSArray *tAarray = [savedObjects allObjects];
        ShoppingListItem *record = tAarray [rowIndex];
        record.checked = chekIt;
    }
}

- (void)saveListToJson:(BOOL)overwritedata
             withError:(NSError **)errorP {
    NSMutableArray *dataArray = [@[] mutableCopy];

    NSArray *arrayListObjects = [self sortByDate];

    for (ShoppingListItem *itemObject in arrayListObjects) {
        NSMutableDictionary *stingDataForJSON = [NSMutableDictionary new];
        [stingDataForJSON setObject:itemObject.name forKey:@"title"];
        [stingDataForJSON setObject:[itemObject.date representData] forKey:@"date"];
        [stingDataForJSON setObject:[NSNumber numberWithBool:itemObject.checked].description forKey:@"checked"];

        [dataArray addObject:stingDataForJSON];
    }

    NSString *jsonData = [JsonWork createJsonData:dataArray];
    [JsonWork saveJsonToFile:jsonData overwritedata:overwritedata withError: errorP];
}

@end
