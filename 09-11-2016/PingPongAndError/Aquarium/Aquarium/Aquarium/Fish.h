//
//  Fish.h
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Fish_h
#define Fish_h

@interface Fish : NSObject

@property (readwrite, nonatomic) int weight;
@property (readwrite, nonatomic) NSString *typeOfFish;

- (BOOL)canIEatYou:(NSString *)typeOfFish;


@end


#endif /* Fish_h */
