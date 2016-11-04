//
//  CatalogRecord.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogRecord.h"
#import "CatalogRecordHelper.h"

@implementation CatalogRecord

- (CatalogRecord*) initWithData: (NSString*)carNumber
							 withCarOwnerName:(NSString*)carOwnerName {

		//create new instanses
		Car *carNew = [[Car new] initWithData:carNumber];
		CarOwner *carOwnerNew = [[CarOwner new] initWithData:carOwnerName];

		car = carNew;
		owner = carOwnerNew;

		return self;
}


@end
