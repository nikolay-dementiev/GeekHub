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

typedef enum PositionСheck : NSString {
    hasDrugs,
    hasGuns,
    forbiddenSubstances,
    hasCriminalPast,
    isBeingSought
} PositionСheck;

@end

#endif /* Header_h */
