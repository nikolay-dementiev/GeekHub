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

+ (JsonWork *)classPropertyContainer
{
    static JsonWork* fooDict = nil;

    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        // create dict
        fooDict = [JsonWork new];

    });

    return fooDict;
}

+ (NSDictionary *)dictionary
{
    static NSDictionary *directoryForFiles = nil;

    if (directoryForFiles == nil) {
        directoryForFiles = [NSDictionary new];
    }

    return directoryForFiles;
}

+ (NSString *)createJsonData:(NSDictionary*)dataForCreation
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
    if (error)
    {
        NSLog(@"Error finding in createJsonData: %@",error);
        //newStr = [NSString stringWithUTF8String:[jsondata bytes]];
    }
    else
    {
        newStr = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    }

    return [newStr stringByAppendingString:@"\r"];
}

//MARK: Save_in/ Load_from file

+ (void)saveJsonToFile:(NSString *)jsonStr
        overwritedata:(BOOL)overwriteFile
            withError:(NSError **)errorP
{

    NSString *fileName = [JsonWork getNameOfJsonFile];
    NSString *fileDyrectory = [JsonWork getDirectoryForFiles:true withError:errorP];

    if (!*errorP)
    {
        NSString *filePath = [fileDyrectory stringByAppendingPathComponent:fileName];

        //chek on existin file
        NSFileManager *fileMng = [NSFileManager defaultManager];
        BOOL fileExist = [fileMng fileExistsAtPath:filePath];

        if (overwriteFile && fileExist)
        {
            //rewrite file
            NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath:filePath];
            [fh seekToEndOfFile];

            NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
            [fh writeData:data];
            [fh closeFile];
        }
        else
        {
            [jsonStr writeToFile:filePath
                      atomically:TRUE
                        encoding:NSUTF8StringEncoding
                           error:errorP];
        }
    }
}

+ (NSString *)loadJsonFromFile:(NSError **)errorP
{
    //http://stackoverflow.com/questions/5100994/how-to-save-load-text-files-in-objective-c-for-the-iphone-using-uitextview

    NSString *fileСontents;

    NSString *fileName = [JsonWork getNameOfJsonFile];
    NSString *fileDyrectory = [JsonWork getDirectoryForFiles:false withError:errorP];

    if (!*errorP)
    {
        NSString *filePath = [fileDyrectory stringByAppendingPathComponent:fileName];
        fileСontents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:errorP];
    }

    return fileСontents;
}

+ (NSString *)getDirectoryForFiles:(BOOL)createDirecroryIfNotExist
                        withError:(NSError **)errorPtr
{
    JsonWork *singeltoneClassObject = [JsonWork classPropertyContainer];
    NSString *urlDict = singeltoneClassObject.urlDirectoryForFiles;

    if ((urlDict == nil) && createDirecroryIfNotExist)
    {
        //        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        //        urlDict = [paths objectAtIndex:0];

        urlDict = [NSTemporaryDirectory() stringByAppendingPathComponent:@"com.app.charSwapInString"];

        NSFileManager *fileMng = [NSFileManager defaultManager];
        if (![fileMng fileExistsAtPath:urlDict])
        {
            [fileMng createDirectoryAtPath:urlDict
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:errorPtr];
        }

        singeltoneClassObject.urlDirectoryForFiles = urlDict;
    }

    return urlDict;
}

+ (NSString *)getNameOfJsonFile
{
    JsonWork *singeltoneClassObject = [JsonWork classPropertyContainer];
    NSString *jsonName = singeltoneClassObject.nameOfJsonFile;

    if (jsonName == nil)
    {
        jsonName = @"CharSwapInString-JSON.json";
        singeltoneClassObject.nameOfJsonFile = jsonName;
    }
    
    return jsonName;
}


@end
