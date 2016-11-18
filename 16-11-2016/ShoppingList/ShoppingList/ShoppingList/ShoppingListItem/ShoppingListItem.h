//
//  ShoppingListItem.h
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef ShoppingListItem_h
#define ShoppingListItem_h

@interface ShoppingListItem : NSObject

@property (readwrite, strong, nonatomic) NSString *name;
@property (readwrite, strong, nonatomic) NSDate *date;
@property (readwrite, nonatomic) BOOL checked;

- (instancetype)init;
- (instancetype)initWithNameOfObject:(NSString *)itemName;


@end

#endif /* ShoppingListItem_h */
