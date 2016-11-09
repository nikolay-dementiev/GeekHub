//
//  CarOwner.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef CarOwner_h
#define CarOwner_h

@interface CarOwner : NSObject

@property (readwrite, strong, nonatomic) NSString *name;

- (id)initWithData:(NSString *)tName;

@end

#endif /* CarOwner_h */
