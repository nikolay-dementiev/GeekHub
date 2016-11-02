//
//  main.m
//  ClassObject3
//
//  Created by Nikolay Dementiev on 02.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Airplaine : NSObject

{
		NSString *mark;
		NSString *model;
		float maxSpeed;
		float maxHeight;
}

- (float)cost;
- (NSString*)information;
@end



int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!");
	}
    return 0;
}
