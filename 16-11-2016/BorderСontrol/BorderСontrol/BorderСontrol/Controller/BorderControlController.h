//
//  BorderControlController.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 20.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef BorderControlController_h
#define BorderControlController_h
@class Country;
#import "BorderControlItem.h"
#import "Guard.h"
#import "ResidentItem.h"

@interface BorderControlController : NSObject {
    Country *countryModel;
}

- (instancetype)initWithModel:(Country *)countryM;
- (void)initiateGuards:(int)numberOfGuards;

- (Guard *)getAnyGuardMan;
- (BOOL)residentHasForbiddenItem:(ResidentItem *)resident
                        guardMan:(Guard *)guardMan;

@end

#endif /* BorderControlController_h */
