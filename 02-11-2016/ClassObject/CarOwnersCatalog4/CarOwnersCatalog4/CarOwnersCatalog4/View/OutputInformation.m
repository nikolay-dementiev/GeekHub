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

//		catalogData
		[catalogList addRecord:([[CatalogRecord new] initWithData:@"Moskwitch-402" withCarOwnerName:@"Vasja"]) withError:&error];

		[catalogList addRecord:([[CatalogRecord new] initWithData:@"Moskwitch-407" withCarOwnerName:@"Petja"]) withError:&error];

		[catalogList addRecord:([[CatalogRecord new] initWithData:@"Moskvitch-2138/40" withCarOwnerName:@"Galja"]) withError:&error];

		[catalogList addRecord:([[CatalogRecord new] initWithData:@"Moskvitch-412" withCarOwnerName:@"Nadja"]) withError:&error];

}

@end
