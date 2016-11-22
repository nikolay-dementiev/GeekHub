//
//  Country.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Country_h
#define Country_h
@class Emigrant;
@class PrisonItem;
@class BoundaryStorageSet;
#import "BoundaryStorageSet.h"
#import "PrisonStorageSet.h"
#import "BorderControlSet.h"

@interface Country : NSObject

@property (readwrite, strong, nonatomic) NSString *name;
@property (readwrite, nonatomic) int numberOfResidents;


@property (readwrite, strong, nonatomic) BoundaryStorageSet *residentSet;
@property (readwrite, strong, nonatomic) PrisonStorageSet *prisonSet;
@property (readwrite, strong, nonatomic) BorderControlSet *borderControlSet;
@property (readwrite, strong, nonatomic) BoundaryStorageSet *receptionCenterSet;
@property (readwrite, strong, nonatomic) BoundaryStorageSet *emigrantSet;

- (instancetype)initWithName:(NSString *)nameOfCountry;
- (instancetype)init;

@end

#endif /* Country_h */
