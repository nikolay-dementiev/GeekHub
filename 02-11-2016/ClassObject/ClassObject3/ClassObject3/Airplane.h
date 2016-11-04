//
//  Airplaine.h
//  ClassObject3
//
//  Created by Nikolay Dementiev on 02.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#ifndef Airplaine_h
#define Airplaine_h

@protocol AirplaneProtocolDelegate
@required
// list of required methods
- (float)cost;
@optional
// list of optional methods
@end


@interface Airplane : NSObject <AirplaneProtocolDelegate> {
		NSString *mark;
		NSString *model;
		float maxSpeed;
		float maxHeight;
}

- (NSString*) information;
- (id) initWithData: (NSString*)tMark
					withModel:(NSString*)tModel
			 withMaxSpeed:(float)tMaxSpeed
			withMaxHeight:(float)tMaxHeight;

@end

#endif /* Airplaine_h */
