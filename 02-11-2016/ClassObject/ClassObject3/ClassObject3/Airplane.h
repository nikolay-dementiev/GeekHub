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
@end


@interface Airplane : NSObject <AirplaneProtocolDelegate>

// краще писати так
- (NSString *)information;

// навіщо t як префікс змінної?
- (id)initWithData:(NSString *)tMark
         withModel:(NSString *)tModel
      withMaxSpeed:(float)tMaxSpeed
     withMaxHeight:(float)tMaxHeight;

@end

#endif /* Airplaine_h */
