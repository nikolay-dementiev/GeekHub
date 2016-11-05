//
//  CarOwner.h
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef CarOwner_h
#define CarOwner_h

@interface CarOwner : NSObject {
		NSString *name;
}

//@property(nonatomic, readwrite) NSString *name;

- (id) initWithData: (NSString*)tName;
- (NSString*) gerOwnersName;
- (void) setOwnersName: (NSString*)newName;

@end

#endif /* CarOwner_h */
