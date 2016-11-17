//
//  JsonWork.h
//  CharSwapInString
//
//  Created by Nikolay Dementiev on 16.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef JsonWork_h
#define JsonWork_h

@interface JsonWork : NSObject

+(JsonWork *)classPropertyContainer;
@property (readwrite, strong, nonatomic) NSString *urlDirectoryForFiles;
@property (readwrite, strong, nonatomic) NSString *nameOfJsonFile;

+(NSString *)createJsonData:(NSDictionary*)dataForCreation;
+(NSString *)getDirectoryForFiles;
+(NSString *)readFromFile;
+(NSString *)writeToFile;

//Save_in/ Load_from file
+(void)saveJsonToFile:(NSString *)jsonStr
        overwritedata:(BOOL)overwriteFile
            withError:(NSError **)errorP;
+(NSString *)getNameOfJsonFile;

@end

#endif /* JsonWork_h */
