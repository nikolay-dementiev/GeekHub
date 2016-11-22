//
//  BoundaryStorage.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 21.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoundaryStorageSet.h"

@implementation BoundaryStorageSet

- (NSArray *)descriptionInArray {

    NSArray *tAarray = [setOfObjects allObjects];

    return tAarray;
}

- (void)addRecord:(BoundaryStorageItem *)record {

    [setOfObjects addObject: record];

};

- (void)deleteRecord:(BoundaryStorageItem *)record {

    [setOfObjects removeObject: record];

}

- (instancetype)init {
    self = [super init];

    if (self) {
        setOfObjects = [NSMutableSet set];
    }

    return self;
}

@end
