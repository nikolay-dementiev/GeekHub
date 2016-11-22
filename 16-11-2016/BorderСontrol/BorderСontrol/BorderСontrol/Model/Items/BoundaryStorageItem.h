//
//  BoundaryStorage.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef BoundaryStorage_h
#define BoundaryStorage_h
@class Emigrant;

@interface BoundaryStorageItem : NSObject

@property (readwrite, strong, nonatomic) Emigrant *emigrantMan;

- (instancetype)initWithEmData:(Emigrant *)emigrant;

@end

#endif /* BoundaryStorage_h */
