//
//  Country.m
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
//#import "Emigrant.h"
//#import "ResidentItem.h"
#import "PrisonStorageSet.h"
#import "BoundaryStorageSet.h"

@implementation Country

- (instancetype)initWithName:(NSString *)nameOfCountry {

    _name = nameOfCountry;

    return self;
}

- (instancetype)init {
    self = [super init];

    if (self) {
//        _resident = [NSMutableSet set];
//        _prison = [NSMutableSet set];
//        _borderControl = [NSMutableSet set];
//        _receptionСenter = [NSMutableSet set];
        _prisonSet = [PrisonStorageSet new];
        _residentSet = [BoundaryStorageSet new];
        _borderControlSet = [BorderControlSet new];
        _receptionCenterSet = [BoundaryStorageSet new];
    }

    return self;
}

//- (void)initiateResidents {
//    
//    for (int i = 0; i < _numberOfResidents; i ++) {
//        Emigrant *newResident = [[Emigrant init] initWithRandomParameters];
//        ResidentItem *newResidentItem = [[ResidentItem new] initWithEmData:newResident];
//        
//        [_residentSet addRecord:newResidentItem];
//    }
//}
//
//- (void)moveEmigrantFrom:(NSMutableSet<BoundaryStorageItem*>*)fromPlace
//           moveItToPlace:(NSMutableSet<BoundaryStorageItem*>*)toPlace {
//
//    
//
//}



@end
