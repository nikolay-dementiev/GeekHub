//
//  BorderControlSet.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 22.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef BorderControlSet_h
#define BorderControlSet_h
#import "BoundaryStorageSet.h"
@class Guard;


@interface BorderControlSet : BoundaryStorageSet

@property (readwrite, strong, nonatomic) NSMutableArray <Guard *> *guardMan;

- (instancetype)init;


@end

#endif /* BorderControlSet_h */
