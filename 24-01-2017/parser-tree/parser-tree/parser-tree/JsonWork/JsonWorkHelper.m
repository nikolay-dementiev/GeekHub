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

    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"sampleFile"
                                                         ofType:@"json"
                                                    inDirectory:@"ImportFiles"];

    if (nil == filepath) {
        NSLog(@"Couldn't find file!");
        return nil;
    }

    NSData *jsonData = [[NSString stringWithContentsOfFile:filepath
                                                  encoding:NSUTF8StringEncoding
                                                     error:nil]
                                         dataUsingEncoding:NSUTF8StringEncoding];

    NSDictionary *results = jsonData ? [NSJSONSerialization
                                        JSONObjectWithData:jsonData
                                        options:0
                                        error:errorPtr] : nil;

    return results;
}

@end

