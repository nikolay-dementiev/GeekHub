//
//  Predator.h
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Predator_h
#define Predator_h
#import "Fish.h"

@interface PredatorFish : Fish

- (PredatorFish *)initWithData:(int)weight;
- (BOOL)letsGetDinner:(Fish*)fish;

@end

#endif /* Predator_h */
