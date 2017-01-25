//
//  NSObject+NSObject_LoadFromNib.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 25.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LoadFromNib)

+ (id)loadFromNib:(NSString *)name classToLoad:(Class)classToLoad;
@end
