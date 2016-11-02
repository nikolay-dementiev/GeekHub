//
//  Airplaine.h
//  ClassObject3
//
//  Created by Nikolay Dementiev on 02.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Airplaine_h
#define Airplaine_h

@interface Airplane : NSObject

{
		NSString *mark;
		NSString *model;
		float maxSpeed;
		float maxHeight;
}

- (float)cost;
- (NSString*)information;

@end

#endif /* Airplaine_h */
