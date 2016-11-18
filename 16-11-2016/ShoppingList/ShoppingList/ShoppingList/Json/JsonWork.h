//
//  JsonWork.h
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef JsonWork_h
#define JsonWork_h

@interface JsonWork : NSObject

+ (JsonWork *)classPropertyContainer;
@property (readwrite, strong, nonatomic) NSString *urlDirectoryForFiles;
@property (readwrite, strong, nonatomic) NSString *nameOfJsonFile;

+ (NSString *)createJsonData:(NSArray*)dataForCreation;
+ (NSString *)getNameOfJsonFile;
+ (NSString *)getDirectoryForFiles:(BOOL)createDirecroryIfNotExist
                         withError:(NSError **)errorPtr;

//Save_in/ Load_from file
+ (void)saveJsonToFile:(NSString *)jsonStr
         overwritedata:(BOOL)overwriteFile
             withError:(NSError **)errorP;
+ (NSString *)loadJsonFromFile:(NSError **)errorP;

@end


#endif /* JsonWork_h */
