//
//  JsonWorkHelper.m
//  parser-tree
//
//  Created by Nikolay Dementiev on 24.01.17.
//  Copyright © 2017 mc373. All rights reserved.
//

#import "JsonWorkHelper.h"

@implementation JsonWorkHelper

+ (NSDictionary *)getTreeData:(NSError **)errorPtr
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"sampleFile" ofType:@"json"];

    NSData *jsonData = [[NSString stringWithContentsOfFile: filepath
                                                  encoding:NSUTF8StringEncoding
                                                     error:nil]
                        dataUsingEncoding:NSUTF8StringEncoding];

    NSDictionary *results = jsonData ? [NSJSONSerialization
                                        JSONObjectWithData:jsonData
                                        options:0
                                        error:errorPtr] : nil;
}

@end

