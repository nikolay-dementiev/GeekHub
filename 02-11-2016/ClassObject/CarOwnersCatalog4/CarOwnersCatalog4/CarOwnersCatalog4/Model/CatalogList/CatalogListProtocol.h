//
//  CatalogListDelegate.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 06.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

// старайся дотримуватися код стайлу

#ifndef CatalogListDelegate_h
#define CatalogListDelegate_h
#import "CatalogRecord.h"
#import "CarOwner.h"

@protocol CatalogListDelegate
@required

- (void)addRecord:(CatalogRecord *)record
        withError:(NSError **)errorPtr;

- (void)addRecordWithDictData:(NSDictionary *)dictData
                    withError:(NSError **)errorPtr;

- (void)deteleRecord:(int)rowIndex
           withError:(NSError **)errorPtr;

- (void)editRecordWithDictData:(NSDictionary *)dictData
                    atRowIndex:(int)rowIndex
                     withError:(NSError **)errorPtr;

- (CarOwner *)findCarOwner:(NSString *)carNumber
                 withError:(NSError **)errorPtr;

- (NSArray *)getSortedCatalog:(NSError **)errorPtr;
@end


#endif /* CatalogListDelegate_h */
