//
//  NSObject+NSObject_LoadFromNib.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "NSObject+LoadFromNib.h"
#import <UIKit/UIKit.h>

@implementation NSObject (LoadFromNib)

+ (id)loadFromNib:(NSString *)name
      classToLoad:(Class)classToLoad {

    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:name owner:self options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:classToLoad]) {
            return object;
        }
    }
    return nil;
}

@end
