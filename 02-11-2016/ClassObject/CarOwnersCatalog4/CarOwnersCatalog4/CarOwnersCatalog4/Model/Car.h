//
//  Car.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Car_h
#define Car_h

// 1. перенести змінну в інтерфейс .m файлу
// 2. дотримуся код стайлу
@interface Car : NSObject {
		NSString *number;
}


- (id) initWithData: (NSString*)tNumber;
- (NSString*) getCarNumber;
- (void)setCarNumber: (NSString*)newNumber;

@end


#endif /* Car_h */
