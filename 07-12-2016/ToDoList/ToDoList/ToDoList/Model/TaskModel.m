//
//  TaskModel.m
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskModel.h"

@interface TaskModel ()

@end

@implementation TaskModel

- (instancetype)initWithData:(NSString *)title {
    self = [super init];

    if (self) {
        //initiation successfully done
        _title = title;
        _dateCreation = [NSDate date];
        _executed = false;
    }

    return self;
}

@end
