//
//  main.m
//  Aquarium
//
//  Created by Nikolay Dementiev on 09.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NormallyFish.h"
#import "PredatorFish.h"
#import "Helper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSMutableSet <Fish*> *aquariumSet = [NSMutableSet set];


        //1.add normalFish in aquarium
        int rndValueOFNormalFish = [Helper getRandomInt:(50) min:10];
        for (int i = 0; i <= rndValueOFNormalFish; i++) {
            int weightOfFish = [Helper getRandomInt:(10) min:1];
            NormallyFish *newFish = [[NormallyFish new] initWithData:(weightOfFish)];
            [aquariumSet addObject: newFish];
        }

//        //2. add predatorFish
//        for (int i = 0; i <= 2; i++) {
//            PredatorFish *newFish = [[PredatorFish new] initWithData:(10)];
//            [aquariumSet addObject: newFish];
//        }
        PredatorFish *predFish1 = [[PredatorFish new] initWithData:(10)];
        [aquariumSet addObject: predFish1];

        PredatorFish *predFish2 = [[PredatorFish new] initWithData:(10)];
        [aquariumSet addObject: predFish2];


        //
        //int lostFish = ((int)[aquariumSet count]) - 1;
        NSArray *tAarray = [aquariumSet allObjects];
        int rowIndex = 0;
        BOOL dinnerOk = false;

        while (rowIndex < [tAarray count]-1) {

            dinnerOk = [predFish1 letsGetDinner:tAarray[rowIndex]];
            rowIndex = rowIndex+1;
//            if (dinnerOk) {
//
//            };

            dinnerOk = [predFish2 letsGetDinner:tAarray[rowIndex]];
            rowIndex = rowIndex+1;
//            if (dinnerOk) {
//                rowIndex = rowIndex+1;
//            };
        };

        NSLog(@"Count of eated fish: '%d', predator1 weight = '%d', predator2 weight = '%d'", rowIndex, predFish1.weight, predFish2.weight);



    }

    return 0;
}
