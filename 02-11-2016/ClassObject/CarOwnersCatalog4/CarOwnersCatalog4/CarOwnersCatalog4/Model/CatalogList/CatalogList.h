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
//- answer: еррорит - нужно чтобы показал как это сделать
// @class "CatalogRecord.h"
#import "CatalogRecord.h"

@interface  CatalogList : NSObject

@property(retain) NSMutableSet <CatalogRecord*> *savedObjects;

- (id)init;

@end

#endif /* Catalog_h */
