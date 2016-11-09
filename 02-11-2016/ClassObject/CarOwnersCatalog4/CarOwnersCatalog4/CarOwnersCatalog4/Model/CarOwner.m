//
//  CarOwner.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarOwner.h"

@implementation CarOwner

@synthesize name = _name;

- (id)initWithData:(NSString *)tName {

		_name = tName;
		return self;
};

//property 'name' set/get-tter

- (void)setName:(NSString *)name {
    if (name) {
        _name = name;
    } else {
        _name = @"null";
    }
}

- (NSString *)name {
    if (!_name) {
        _name = @"null";
    }
    return _name;
}

@end
