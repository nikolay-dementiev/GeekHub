//
//  Catalog.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogList.h"

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

//		CatalogRecord *record = savedObjects [rowIndex];
//		[savedObjects removeObject: record];

};

- (void) editRecord: (CatalogRecord*)record withError:(NSError **)errorPtr {
//
//		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"car.number == %@ & owner.name == %@", record.car, record.owner];
//		
//		[savedObjects filterUsingPredicate:predicate];
//
//		if ([savedObjects count] > 0 ) {
//
//		};

};

- (CarOwner*) findCarOwner: (NSString*)carNumber
								 withError:(NSError **)errorPtr {

		return nil;
};

- (void) printSortedCatalog: (NSError **)errorPtr {

};

//MARK: - NSSet methods
//- (void)addObject:(ObjectType)object {
//
//};

//MARK: Singeltone

//-(CatalogList*) sharedManager {
//		return [CatalogList sharedManager];//sharedManager;
//}
//
//- (void) setSharedManager: (CatalogList*) pt {
//		sharedManager = pt;
//}

+ (id)sharedManager {
		static CatalogList *sharedMyManager = nil;
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
				sharedMyManager = [self new];
				sharedMyManager->savedObjects = [NSMutableSet set];

		});
		return sharedMyManager;
}

@end
