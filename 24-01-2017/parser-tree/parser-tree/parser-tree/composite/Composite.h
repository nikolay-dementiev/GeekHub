//
//  composite.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Composite : NSObject

@property (readwrite, strong, nonatomic) NSNumber *dataOfObject;
@property (readwrite, strong, nonatomic) NSMutableArray *embeddedArray;

- (instancetype)initWithData:(NSNumber *)data;

@end
