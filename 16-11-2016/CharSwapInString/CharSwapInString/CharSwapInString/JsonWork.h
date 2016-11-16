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

+ (JsonWork*)classPropertyContainer;
@property (readwrite, strong, nonatomic) NSString *urlDirectoryForFiles;

+ (NSString*)createJsonData:(NSDictionary*)dataForCreation;
+ (NSString*)getDirectoryForFiles;
+ (NSString*)readFromFile;
+ (NSString*)writeToFile;

@end

#endif /* JsonWork_h */
