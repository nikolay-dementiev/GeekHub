//
//  JsonWork.m
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonWork.h"

@implementation JsonWork

+ (NSString *)createJsonData:(NSDictionary*)dataForCreation {
    //http://stackoverflow.com/questions/16057281/creating-json-format-in-objective-c

    NSError *error = nil;
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dataForCreation options:NSJSONWritingPrettyPrinted error:&error];
    NSString *newStr = @"";

    //http://stackoverflow.com/questions/2467844/convert-utf-8-encoded-nsdata-to-nsstring
    if (error) {
        NSLog(@"Error finding in createJsonData: %@",error);
    } else {
        newStr = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    }

    return [newStr stringByAppendingString:@"\r"];
}



@end
