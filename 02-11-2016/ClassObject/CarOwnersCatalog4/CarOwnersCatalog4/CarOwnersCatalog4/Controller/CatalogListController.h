//
//  CatalogController.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef CatalogListController_h
#define CatalogListController_h
#import "CatalogListProtocol.h"
#import "CatalogList.h"

@interface CatalogListController : NSObject<CatalogListDelegate> {

		CatalogList *catalogListModel;
		NSMutableSet <CatalogRecord*> *savedObjects;
}

+ (id) sharedManager;
- (id) init;

@end


#endif /* CatalogController_h */
