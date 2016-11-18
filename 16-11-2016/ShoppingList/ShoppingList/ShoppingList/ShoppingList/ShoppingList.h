//
//  ShoppingList.h
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef ShoppingList_h
#define ShoppingList_h
@class ShoppingListItem;

@interface ShoppingList : NSObject {
    NSMutableSet <ShoppingListItem*> *savedObjects;
}

//@property(retain) NSMutableSet <ShoppingListItem*> *savedObjects;

- (NSArray *)sortByDate;
- (void)addNewElement:(NSString *)itemName;
- (void)deleteElement:(int)rowIndex;
- (void)tickCheck:(int)rowIndex
         chekItem:(BOOL)chekIt;

-(instancetype)init;
+ (instancetype)sharedInstance;

@end

#endif /* ShoppingList_h */
