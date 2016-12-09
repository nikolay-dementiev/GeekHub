//
//  TaskModel.h
//  ToDoList
//
//  Created by Nikolay Dementiev on 09.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

@interface TaskModel : NSObject

@property (nonatomic, readwrite, strong) NSDate *dateCreation;
@property (nonatomic, readwrite, strong) NSString *title;
@property (nonatomic, readwrite) BOOL executed;

- (instancetype)initWithData:(NSString *)title;

@end

//#ifndef TaskModel_h
//#define TaskModel_h
//
//
//#endif /* TaskModel_h */
