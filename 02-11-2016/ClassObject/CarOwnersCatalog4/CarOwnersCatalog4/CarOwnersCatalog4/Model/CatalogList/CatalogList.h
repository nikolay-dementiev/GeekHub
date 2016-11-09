//
//  Catalog.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Catalog_h
#define Catalog_h

// якщо не потрбв класі бачити ніяких внутрощів можна просто підключити клас
// @class "CatalogRecord.h"
#import "CatalogRecord.h"

// навіщо тобі тут цей протокол 
#import "CatalogListProtocol.h"

@interface  CatalogList : NSObject {

		id<CatalogListDelegate> delegate;
}

@property(retain) NSMutableSet <CatalogRecord*> *savedObjects;

- (id) init;

@end

#endif /* Catalog_h */
