//
//  BorderControlItem.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef BorderControlItem_h
#define BorderControlItem_h
#import "BoundaryStorageItem.h"
@class Guard;

@interface BorderControlItem : BoundaryStorageItem

@property (readwrite, strong, nonatomic) Guard *guardMan;


@end

#endif /* BorderControlItem_h */
