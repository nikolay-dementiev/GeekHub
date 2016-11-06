//
//  OutputInformationController.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 06.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OutputInformationController.h"
#import "CatalogListController.h"

@implementation OutputInformationController

//MARK: - controller test functions

- (void) addInformationToDataBase: (NSError **)errorPtr {
		NSMutableDictionary *newData;

		//first record
		newData = @{@"car": @"AA102", @"owner": @"Vasja"}.mutableCopy;
		[catalogListController addRecordWithDictData:newData withError:errorPtr];

		//second record
		newData = @{@"car": @"BB407", @"owner": @"Petja"}.mutableCopy;
		[catalogListController addRecordWithDictData:newData withError:errorPtr];

		//third record
		newData = @{@"car": @"CC540", @"owner": @"Galja"}.mutableCopy;
		[catalogListController addRecordWithDictData:newData withError:errorPtr];

		//fourth record
		newData = @{@"car": @"FF412", @"owner": @"Nadja"}.mutableCopy;
		[catalogListController addRecordWithDictData:newData withError:errorPtr];
}

- (void) deteleRecordFromDataBase: (NSError **)errorPtr {

		[catalogListController deteleRecord:6 withError:errorPtr];
		// Error must be there!!

		[catalogListController deteleRecord:1 withError:errorPtr];
};

- (void) editRecordInDataBase: (NSError **)errorPtr {

		NSDictionary *newData = @{@"car" : @"HH567",
															@"owner" : @"Lena"
															};
		[catalogListController editRecordWithDictData: newData
																			 atRowIndex: 0
																				withError: errorPtr];

};

- (NSDictionary*) findRecordInDataBase: (NSError **)errorPtr {

		NSString *searchedNumber = @"F41";
		CarOwner *carOwnerSearched = [catalogListController findCarOwner: searchedNumber withError:errorPtr];

		NSDictionary *dataForReturn = @{@"car" : searchedNumber,
																		@"owner" : [carOwnerSearched gerOwnersName]
																		};

		return dataForReturn;
};

- (NSString*) printSortedDataFromDataBase: (NSError **)errorPtr {

		NSString *logToReturn = @"";
		NSArray *arayForView = [catalogListController getSortedCatalog:errorPtr];

		logToReturn = [logToReturn stringByAppendingString: @"\nPrinting a sorted array"];
		for (CatalogRecord *object in arayForView) {

				logToReturn = [logToReturn stringByAppendingFormat:
											 @"\n  owner = '%@', car number = '%@'"
											 , [object.owner gerOwnersName]
											 , [object.car getCarNumber]];
		};

		return logToReturn;
};

//MARK: - instanse functions

- (id) getSharedManagerCatalogListController {

		return [CatalogListController sharedManager];
}

- (id) init {

		catalogListController = [self getSharedManagerCatalogListController];
		
		return self;
};

@end
