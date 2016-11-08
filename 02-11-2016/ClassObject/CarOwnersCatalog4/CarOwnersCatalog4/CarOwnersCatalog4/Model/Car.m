//
//  Car.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@implementation Car

- (id) initWithData: (NSString*)tNumber {

		number = tNumber;

		return self;
};

// якщо в змінної є гетер і сетер то роби цю змінну як проперті https://habrahabr.ru/post/265175/

- (NSString*) getCarNumber {

		return number;
};

- (void) setCarNumber: (NSString*)newNumber {
		number = newNumber;
};

@end
