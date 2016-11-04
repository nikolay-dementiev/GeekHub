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
#import "CatalogRecordHelper.h"
#import "CatalogRecord.h"

@interface  CatalogList : NSObject {
		NSMutableSet <CatalogRecord*> *savedObjects;
}

+ (id)sharedManager;

- (void) addRecord: (CatalogRecord*)record withError:(NSError **)errorPtr;
- (void) deteleRecord: (NSError **)errorPtr;
- (void) editRecord: (NSError **)errorPtr;
- (CarOwner*) findCarOwner: (NSString*)carNumber withError:(NSError **)errorPtr;
- (void) printSortedCatalog:(NSError **)errorPtr;

@end

#endif /* Catalog_h */
