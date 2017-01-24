//
//  JsonWorkHelper.h
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonWorkHelper : NSObject

+ (NSDictionary *)getTreeData:(NSError **)errorPtr;

@end
