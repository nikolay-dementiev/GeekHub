//
//  Catalog.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogList.h"
#import "CatalogRecord.h"
#import "Car.h"
#import "CarOwner.h"

@implementation CatalogList

- (void) addRecord: (CatalogRecord*)record withError:(NSError **)errorPtr {

		[savedObjects addObject: record];

};

- (void) deteleRecord: (int)rowIndex withError:(NSError **)errorPtr {

		if (rowIndex >= [savedObjects count]) {
				NSString *domain = @"com.test.CarOwnersCatalog4.ErrorDomain";//[[NSBundle mainBundle] bundleIdentifier];
				NSString *desc = [NSString stringWithFormat: @"Try to delete row at index '%d' which is not exist", rowIndex];
				NSDictionary *userInfo = [[NSDictionary alloc]
																	initWithObjectsAndKeys:desc,
																	@"NSLocalizedDescriptionKey",NULL];
				*errorPtr = [NSError errorWithDomain:domain
																				code: 404
																		userInfo:userInfo];

				return;

		};

		NSArray *tAarray = [savedObjects allObjects];
		CatalogRecord *record = tAarray [rowIndex];
		[savedObjects removeObject: record];

};

//- (void) editRecord: (CatalogRecord*)record withError:(NSError **)errorPtr {
//
//		NSPredicate *predicate = [NSPredicate
//															predicateWithFormat:@"car.number == %@ & owner.name == %@"
//															, record.car
//															, record.owner];
//
//		[savedObjects filterUsingPredicate:predicate];
////
////		if ([savedObjects count] > 0 ) {
////
////		};
//
//};

//- (void) editRecordWhithRowIndex: (int)rowIndex
//									 withCarNumber:(NSString*)carNumber
//											 withError:(NSError **)errorPtr {
//
//		if (rowIndex < [savedObjects count]) {
//				NSArray *tAarray = [savedObjects allObjects];
//				CatalogRecord *record = tAarray [rowIndex];
//
//				[self editRecord: record withError:errorPtr];
//
//		}
//};
//
//- (void) editRecordWithDictData: (NSDictionary*)dictData
//											withError:(NSError **)errorPtr {
////		for (<#initialization#>; <#condition#>; <#increment#>) {
////    <#statements#>
////		}
//
//}

- (void) editRecordWithDictData: (NSDictionary*)dictData
										 atRowIndex: (int)rowIndex
											withError:(NSError **)errorPtr {

		if (rowIndex < [savedObjects count]) {
				NSArray *tAarray = [savedObjects allObjects];
				CatalogRecord *record = tAarray [rowIndex];

				//[self editRecord: record withError:errorPtr];
				NSPredicate *predicate = [NSPredicate
																	predicateWithFormat:@"car.number == %@ && owner.name == %@"
																	,[record.car getCarNumber]
																	,[record.owner gerOwnersName]];

				NSSet *requiredRecord = [NSSet setWithSet: savedObjects];
				requiredRecord = [requiredRecord filteredSetUsingPredicate:predicate];

				if ([requiredRecord count] > 0) {
						NSArray *tAarray2 = [requiredRecord allObjects];
						CatalogRecord *record = tAarray2 [rowIndex];

						[record.car setCarNumber: dictData[@"car"]];
						[record.owner setOwnersName: dictData[@"owner"]];

				};
		};
};

- (CarOwner*) findCarOwner: (NSString*)carNumber
								 withError:(NSError **)errorPtr {

		CarOwner* valueForReturn = nil;

		NSPredicate *predicate = [NSPredicate
															predicateWithFormat:@"car.number CONTAINS %@"
															,carNumber];

		NSSet *requiredOwner = [NSSet setWithSet: savedObjects];
		requiredOwner = [requiredOwner filteredSetUsingPredicate:predicate];

		if ([requiredOwner count] > 0) {
				NSArray *tAarray = [requiredOwner allObjects];
				valueForReturn = ((CatalogRecord*)tAarray[0]).owner; // getting first value
		};

		return valueForReturn;
};

- (NSArray*) getSortedCatalog: (NSError **)errorPtr {

		NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"car.number" ascending:YES];

		NSArray *sortedArray = [savedObjects sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];

		return sortedArray;
};


//MARK: Singeltone

+ (id)sharedManager {
		static CatalogList *sharedMyManager = nil;
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
				sharedMyManager = [self new];
				sharedMyManager->savedObjects = [NSMutableSet set];
				
		});
		return sharedMyManager;
};

@end
