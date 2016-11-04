//
//  CatalogRecord.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef CatalogRecord_h
#define CatalogRecord_h
#import "CatalogRecordHelper.h"
#import "Car.h"
#import "CarOwner.h"

@interface CatalogRecord : NSObject {
		Car *car;
		CarOwner *owner;
}


- (CatalogRecord*) initWithData: (NSString*)carNumber
							 withCarOwnerName:(NSString*)carOwnerName;

@end

#endif /* CatalogRecord_h */
