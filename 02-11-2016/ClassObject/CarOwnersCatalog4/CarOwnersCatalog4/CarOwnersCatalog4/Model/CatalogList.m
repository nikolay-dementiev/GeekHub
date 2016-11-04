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

- (void) deteleRecord: (NSError **)errorPtr {

};

- (void) editRecord: (NSError **)errorPtr {

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
