//
//  PrisonStorageSet.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 21.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef PrisonStorageSet_h
#define PrisonStorageSet_h
#import "BoundaryStorageSet.h"
#import "PrisonItem.h"

@interface PrisonStorageSet : BoundaryStorageSet

//@property (readwrite, strong, nonatomic) NSMutableSet <PrisonItem*> *setOfObjects;
- (instancetype)init;

@end

#endif /* PrisonStorageSet_h */
