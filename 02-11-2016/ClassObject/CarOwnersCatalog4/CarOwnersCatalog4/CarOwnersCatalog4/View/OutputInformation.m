//
//  OutputInformation.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OutputInformation.h"
#import "CatalogList.h"
#import "CatalogRecord.h"


@implementation OutputInformation

- (void) makePrintTestInformation {

		//test
		CatalogList *catalogList = [CatalogList sharedManager];
		NSError *error = nil;

		//1.add data
		[catalogList addRecord:([[CatalogRecord new] initWithData:@"AA102" withCarOwnerName:@"Vasja"]) withError:&error];

		[catalogList addRecord:([[CatalogRecord new] initWithData:@"BB407" withCarOwnerName:@"Petja"]) withError:&error];

		[catalogList addRecord:([[CatalogRecord new] initWithData:@"CC540" withCarOwnerName:@"Galja"]) withError:&error];

		[catalogList addRecord:([[CatalogRecord new] initWithData:@"FF412" withCarOwnerName:@"Nadja"]) withError:&error];

		//2. delete data
		[catalogList deteleRecord:5 withError:&error];
		if(error) {
				NSLog(@"Error findin: %@",error);
		};
		error = nil;
		[catalogList deteleRecord:1 withError:&error];

		//3. edit data
		//		[catalogList editRecordWhithRowIndex:2 withCarNumber: @"Moskwitch-409" withError:&error];
		NSDictionary *newData = @{@"car" : @"HH567",
															@"owner" : @"Lena"
															};
		[catalogList editRecordWithDictData: newData
														 atRowIndex: 0
															withError: &error];

		//4. finding record
		NSString *searchedNumber = @"F41";
		CarOwner *carOwnerSearched = [catalogList findCarOwner: searchedNumber withError:&error];
		NSLog(@"Searched car owner by car number '%@' is '%@'", searchedNumber, [carOwnerSearched gerOwnersName]);
		
		//5. printing a sorted array
		NSArray *arayForView = [catalogList getSortedCatalog:&error];
		NSLog(@"\nPrinting a sorted array");
		for (CatalogRecord *object in arayForView) {
				NSLog(@"\n  owner = '%@', car number = '%@'", [object.owner gerOwnersName], [object.car getCarNumber]);
		}

}

@end
