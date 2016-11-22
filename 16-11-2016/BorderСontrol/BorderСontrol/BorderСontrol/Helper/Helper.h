//
//  Header.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Header_h
#define Header_h

@interface Helper : NSObject

typedef enum PositionForCheking {
    drugs,
    guns,
    forbiddenSubstances,
    criminalPast,
    isBeingSought
} PositionForCheking;
+ (NSArray *)getArrayPositionForCheking;

+ (int)getRandomInt:(int)maxValue
                min:(int)minValue;
+ (BOOL)getRandomBool;
+ (NSString *)randomStringWithLength:(int)len;
+ (NSString *)getRandomHumanName:(int)nameLenth;

@end

#endif /* Header_h */
