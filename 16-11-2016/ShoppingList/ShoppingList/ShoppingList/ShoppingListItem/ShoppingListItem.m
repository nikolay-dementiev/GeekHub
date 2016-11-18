//
//  ShoppingListItem.m
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingListItem.h"

@implementation ShoppingListItem

- (instancetype)initWithNameOfObject:(NSString *)itemName {

    _name = itemName;

    return self;
}

-(instancetype)init {
    self = [super init];

    if (self) {
        _date = [self getCurrentDate];
        _checked = false;
    }

    return self;
}

- (NSDate *)getCurrentDate {

    NSDate *todayDate = [NSDate date]; // get today date

    return todayDate;
}

@end



