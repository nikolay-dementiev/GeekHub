//
//  Prison.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Prison_h
#define Prison_h
#import "BoundaryStorageItem.h"

@class Guard;

@interface PrisonItem : BoundaryStorageItem

@property (readwrite, strong, nonatomic) Guard *guardMan;


@end

#endif /* Prison_h */
