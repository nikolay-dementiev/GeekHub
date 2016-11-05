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
- (void) deteleRecord: (int)rowIndex withError:(NSError **)errorPtr;
//- (void) editRecord: (CatalogRecord*)record withError:(NSError **)errorPtr;
//- (void) editRecordWhithRowIndex: (int)rowIndex
//									 withCarNumber:(NSString*)carNumber
//											 withError:(NSError **)errorPtr;
- (void) editRecordWithDictData: (NSDictionary*)dictData
										 atRowIndex: (int)rowIndex
											withError:(NSError **)errorPtr;

- (CarOwner*) findCarOwner: (NSString*)carNumber withError:(NSError **)errorPtr;
- (NSArray*) getSortedCatalog:(NSError **)errorPtr;

@end

#endif /* Catalog_h */
