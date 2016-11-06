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
#import "CatalogListController.h"

@implementation CatalogList

- (id) init {

		_savedObjects = [NSMutableSet set];

		return self;
};

@end
