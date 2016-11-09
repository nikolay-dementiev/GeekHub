//
//  main.m
//  PingPongAndError
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//    return 0;
//}

#import <Foundation/Foundation.h>
#include <stdlib.h>


@interface Randomizer : NSObject {

@private
    NSMutableArray *_players;
    NSMutableArray *_result;

}


- (void)generateCommand;
- (void)printResult;


@end


@implementation Randomizer


- (id)init
{
    if (self = [super init]) {
        _players = [NSMutableArray arrayWithObjects:@"Ukraine", @"Russia", @"USA", @"China", @"Italy", @"France", @"Spain", @"Germany", @"England", @"Ireland", @"Norway", @"Holland", @"Poland", @"Netherlands", @"Iceland", @"Portugal", nil];

        _result = [NSMutableArray new];
    }

    return self;
}


- (void)generateCommand
{
    NSMutableArray *command = [NSMutableArray new];

    while ([_players count]-1 != 0) {
        if ([command count] < 2) {
//         if ([command count] < 1) {
            NSUInteger index = arc4random_uniform((int)[_players count]);
            NSString *randCountry = [_players objectAtIndex:index];
            [command addObject:[randCountry copy]];

//            [_players removeObjectAtIndex:index + 1];
            [_players removeObjectAtIndex:index];

        } else {
            [_result addObject:[NSArray arrayWithArray:command]];
            [command removeAllObjects];
        }
    }
}


- (void)printResult
{
    for (NSArray *command in _result) {
//        NSLog(@"[%@ - %@]", command.firstObject, command.firstObject);
        NSLog(@"[%@ - %@]", command.firstObject, command.lastObject);


    }
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Randomizer *randomizer = [Randomizer new];
        [randomizer generateCommand];

        [randomizer printResult];
        
    }
    return 0;
}
