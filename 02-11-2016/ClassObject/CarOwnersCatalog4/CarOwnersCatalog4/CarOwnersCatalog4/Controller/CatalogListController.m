//
//  CatalogController.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatalogListController.h"
#import "CatalogList.h"
#import "CatalogRecord.h"
#import "Car.h"
#import "CarOwner.h"


@implementation CatalogListController

- (id)init {

    catalogListModel = [CatalogList new];
    savedObjects = catalogListModel.savedObjects;

    return self;
};

//@synthesize savedObjects;

- (void)addRecord:(CatalogRecord *)record
        withError:(NSError **)errorPtr {

    [savedObjects addObject: record];

};

- (void)addRecordWithDictData:(NSDictionary *)dictData
                    withError:(NSError **)errorPtr {

    CatalogRecord *newCatalogRecord = [[CatalogRecord new] initWithData:dictData[@"car"]
                                                       withCarOwnerName:dictData[@"owner"]];

    [self addRecord: newCatalogRecord withError:errorPtr];
};


- (void)deteleRecord:(int)rowIndex
           withError:(NSError **)errorPtr {

    if (rowIndex >= [savedObjects count]) {
        NSString *domain = @"com.test.CarOwnersCatalog4.ErrorDomain";
        //[[NSBundle mainBundle] bundleIdentifier];
        NSString *desc = [NSString stringWithFormat: @"Try to delete row at index '%d' which is not exist", rowIndex];
        NSDictionary *userInfo = [[NSDictionary alloc]
                                  initWithObjectsAndKeys:desc,
                                  @"NSLocalizedDescriptionKey",NULL];
        *errorPtr = [NSError errorWithDomain:domain
                                        code: 404
                                    userInfo:userInfo];

        return;
    };

    NSArray *tAarray = [savedObjects allObjects];
    CatalogRecord *record = tAarray [rowIndex];
    [savedObjects removeObject: record];

};

- (void)editRecordWithDictData:(NSDictionary *)dictData
                    atRowIndex:(int)rowIndex
                     withError:(NSError **)errorPtr {

    if (rowIndex < [savedObjects count]) {
        NSArray *tAarray = [savedObjects allObjects];
        CatalogRecord *record = tAarray [rowIndex];

        NSPredicate *predicate = [NSPredicate
                                  predicateWithFormat:@"car.number == %@ && owner.name == %@"

                                  ,record.car
                                  ,record.owner];

        NSSet *requiredRecord = [NSSet setWithSet: savedObjects];
        requiredRecord = [requiredRecord filteredSetUsingPredicate:predicate];

        if ([requiredRecord count] > 0) {
            NSArray *tAarray2 = [requiredRecord allObjects];
            CatalogRecord *record = tAarray2 [rowIndex];

            record.car = dictData[@"car"];
            record.owner = dictData[@"owner"];

        };
    };
};

- (CarOwner *)findCarOwner: (NSString *)carNumber
                 withError:(NSError **)errorPtr {

    CarOwner* valueForReturn = nil;

    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"car.number CONTAINS %@"
                              ,carNumber];

    NSSet *requiredOwner = [NSSet setWithSet: savedObjects];
    requiredOwner = [requiredOwner filteredSetUsingPredicate:predicate];

    if ([requiredOwner count] > 0) {
        NSArray *tAarray = [requiredOwner allObjects];
        valueForReturn = ((CatalogRecord*)tAarray[0]).owner; // getting first value
    };

    return valueForReturn;
};

- (NSArray *)getSortedCatalog:(NSError **)errorPtr {
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"car.number" ascending:YES];
    
    NSArray *sortedArray = [savedObjects sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    return sortedArray;
};

//MARK:- Singeltone

+ (id)sharedManager {
    
    static CatalogListController *sharedMan = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMan = [self new];
    });
    
    return sharedMan;
};


@end
