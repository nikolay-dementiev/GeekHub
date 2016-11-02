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


//MARK: - input point of programm
@interface InputPoint : NSObject

- (void) makeSomeWork;

@end

@implementation InputPoint

- (void) makeSomeWork {
		Airplane *airplane = [Airplane init];
		[airplane cost];
		[airplane information];
}

@end


//MARK: - main
int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!");
	}
    return 0;
}
