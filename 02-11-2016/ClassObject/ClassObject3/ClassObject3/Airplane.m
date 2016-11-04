//
//  Airplane.m
//  ClassObject3
//
//  Created by Nikolay Dementiev on 02.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Airplane.h"


@implementation Airplane

- (float) cost {

		//по формуле Максимальная скорость * 1000 + Максимальная высота * 100
		return maxSpeed * 1000 + maxHeight * 100;
}

- (NSString*) information {

		return [NSString stringWithFormat: @"Airplane mark = '%@', model = '%@', maxSpeed = '%0.2f', maxHeight = '%0.4f'", mark, model, maxSpeed, maxHeight];

}

- (id) init {

		return self;
}

- (id) initWithData: (NSString*)tMark
					withModel:(NSString*)tModel
			 withMaxSpeed:(float)tMaxSpeed
			withMaxHeight:(float)tMaxHeight {

		mark = tMark;
		model = tModel;
		maxSpeed = tMaxSpeed;
		maxHeight = tMaxHeight;

		return self;
}


@end
