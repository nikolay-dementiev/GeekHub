//
//  TaskModel.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskModel.h"

@implementation TaskModel

- (instancetype)initWithData:(NSString *)title {
    self = [super init];

    if (self) {
        //initiation successfully done
        self.title = title;
        self.dateCreation = [NSDate date];
        self.executed = false;
    }

    return self;
}

- (NSComparisonResult)compareTitle:(TaskModel *)otherObject {
    return [self.title compare:otherObject.title];
}

@end
