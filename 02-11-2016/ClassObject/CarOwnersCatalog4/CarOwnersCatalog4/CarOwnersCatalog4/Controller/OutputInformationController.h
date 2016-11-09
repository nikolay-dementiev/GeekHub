//
//  OutputInformationController.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 06.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef OutputInformationController_h
#define OutputInformationController_h
#import "CatalogListController.h"

@interface OutputInformationController : NSObject {

    CatalogListController *catalogListController;
}

//controller functions
- (void)addInformationToDataBase:(NSError **)errorPtr;
- (void)deteleRecordFromDataBase:(NSError **)errorPtr;
- (void)editRecordInDataBase:(NSError **)errorPtr;
- (NSDictionary *)findRecordInDataBase:(NSError **)errorPtr;
- (NSString *)printSortedDataFromDataBase:(NSError **)errorPtr;

//instanse functions
- (id)getSharedManagerCatalogListController;
- (id)init;

@end

#endif /* OutputInformationController_h */
