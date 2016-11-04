//
//  Catalog.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Catalog_h
#define Catalog_h
#import "Car.h"
#import "CarOwner.h"

@interface  Catalog : NSObject {
		Car car;
		CarOwner owner;
}


@end

#endif /* Catalog_h */
