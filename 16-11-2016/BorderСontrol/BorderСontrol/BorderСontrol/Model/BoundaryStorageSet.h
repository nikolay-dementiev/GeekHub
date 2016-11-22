//
//  BoundaryStorageSet.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 21.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef BoundaryStorageSet_h
#define BoundaryStorageSet_h
@class BoundaryStorageItem;

@interface BoundaryStorageSet : NSObject {
   NSMutableSet *setOfObjects;
// NSMutableSet <__covariant ObjectType> *setOfObjects;
}

//typedef NSMutableSet <BoundaryStorageItem*> typeOfBoundarySet;

//@property (readwrite, strong, nonatomic) NSMutableSet <BoundaryStorageItem*> *setOfObjects;

@property (readonly) NSArray *descriptionInArray;

- (void)addRecord:(BoundaryStorageItem *)record;
- (void)deleteRecord:(BoundaryStorageItem *)record;

- (instancetype)init;


@end

#endif /* BoundaryStorageSet_h */
