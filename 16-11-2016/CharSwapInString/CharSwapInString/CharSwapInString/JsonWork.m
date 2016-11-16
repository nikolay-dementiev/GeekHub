//
//  JsonWork.m
//  CharSwapInString
//
//  Created by Nikolay Dementiev on 16.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonWork.h"

@implementation JsonWork

+ (JsonWork*)classPropertyContainer
{
    static JsonWork* fooDict = nil;

    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        // create dict
        fooDict = [JsonWork new];

    });

    return fooDict;
}

+ (NSDictionary *)dictionary {
    static NSDictionary *directoryForFiles = nil;
    if (directoryForFiles == nil) {
        directoryForFiles = [NSDictionary new];
    }
    return directoryForFiles;
}

+ (NSString*)createJsonData:(NSDictionary*)dataForCreation
{
    //http://stackoverflow.com/questions/16057281/creating-json-format-in-objective-c

    NSMutableDictionary *stringDetails = [[NSMutableDictionary alloc] init];
    [stringDetails setObject:dataForCreation[@"firstString"] forKey:@"first_string"];
    [stringDetails setObject:dataForCreation[@"secondString"] forKey:@"second_string"];

    NSMutableDictionary *sdetails = [[NSMutableDictionary alloc] init];
    [sdetails setObject:stringDetails forKey:@"strings"];

    //    NSLog(@"Required Format Data is \n%@",sdetails);

    NSError *error = nil;
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:sdetails options:NSJSONWritingPrettyPrinted error:&error];
    NSString *newStr = @"";

    //http://stackoverflow.com/questions/2467844/convert-utf-8-encoded-nsdata-to-nsstring
    if(error)
    {
        NSLog(@"Error finding in createJsonData: %@",error);
        //newStr = [NSString stringWithUTF8String:[jsondata bytes]];
    }
    else
    {
        newStr = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    }


    return newStr;

}

+ (NSString*)getDirectoryForFiles
{
    NSString *urlDict = [JsonWork classPropertyContainer].urlDirectoryForFiles;

    if (urlDict == nil)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains
        (NSDocumentDirectory, NSUserDomainMask, YES);

        urlDict = [paths objectAtIndex:0];
    }

    return urlDict;
}


@end
