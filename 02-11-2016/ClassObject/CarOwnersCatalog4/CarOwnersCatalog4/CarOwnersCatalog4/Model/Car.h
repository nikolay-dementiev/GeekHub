//
//  Car.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Car_h
#define Car_h

@interface Car : NSObject {
		NSString *number;
}

//@property(nonatomic, readwrite) NSString *number;

- (id) initWithData: (NSString*)tNumber;
- (NSString*) getCarNumber;
- (void) setCarNumber: (NSString*)newNumber;

@end


#endif /* Car_h */
