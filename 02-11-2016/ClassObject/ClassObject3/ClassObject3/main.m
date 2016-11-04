//
//  main.m
//  ClassObject3
//
//  Created by Nikolay Dementiev on 02.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Airplane.h"
#import "Bomber.h"
#import "Fighter.h"


//MARK: - input point of programm
@interface InputPoint : NSObject

- (void) makeSomeWork;

@end

@implementation InputPoint

- (void) makeSomeWork {

		Airplane *airplane = [[Airplane new] initWithData:@"Mriya"
																						withModel:@"An-225"
																				 withMaxSpeed:763.2
																				withMaxHeight:10750];
		float airplaneCost = [airplane cost];
		NSString *airplaneInformation = [airplane information];

		Bomber *bomber = [[Bomber new] initWithData:@"Northrop"
																			withModel:@"B-2 Spirit"
																	 withMaxSpeed:1010
																	withMaxHeight:18000];
		float bomberCost = [bomber cost];
		NSString *bomberInformation = [bomber information];

		Fighter *fighter = [[Fighter new] initWithData:@"Lockheed Martin"
																				 withModel:@"F-22 Raptor"
																			withMaxSpeed:2410
																		 withMaxHeight:7600];
		float fighterCost = [fighter cost];
		NSString *fighterInformation = [fighter information];

		//output information
		NSLog(@"Info: \n 1.'%@'; cost: '%0.2f'$", airplaneInformation, airplaneCost);
		NSLog(@"Info: \n 2.'%@'; cost: '%0.2f'$", bomberInformation, bomberCost);
		NSLog(@"Info: \n 3.'%@'; cost: '%0.2f'$", fighterInformation, fighterCost);

}

@end


//MARK: - main
int main(int argc, const char * argv[]) {
		@autoreleasepool {

				InputPoint *point = [InputPoint new];
				[point makeSomeWork];

		}
		return 0;
}
