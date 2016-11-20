//
//  Country.h
//  BorderСontrol
//
//  Created by Nikolay Dementiev on 19.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Country_h
#define Country_h
@class Emigrant;
@class PrisonItem;
@class BorderControlItem;
@class ReceptionСenterItem;

@interface Country : NSObject

@property (readwrite, strong, nonatomic) NSString *name;

@property (readwrite, nonatomic) int numberOfResidents;
@property (readwrite, strong, nonatomic) NSMutableSet <PrisonItem*> *prison;
@property (readwrite, strong, nonatomic) NSMutableSet <BorderControlItem*> *borderControl;
@property (readwrite, strong, nonatomic) NSMutableSet <ReceptionСenterItem*> *receptionСenter;

- (instancetype)initWithName:(NSString *)nameOfCountry;

@end

#endif /* Country_h */
