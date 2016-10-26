//
//  main.m
//  Obj-C-LineAndArray
//
//  Created by Nikolay Dementiev on 26.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleLineClass: NSObject

//- (NSNumber *)multiplyA:(NSNumber *)a withB:(NSNumber *)b;
//1
- (void) testSomeLine;
@end

@implementation SampleLineClass

//MARK: - Lines
//MARK: #1
- (void) testSomeLine {

		NSString *lineForTest = @"Дана строка, содержащая текст. Найти длину самого короткого слова и самого длинного слова.";

		//remove special symbols
		NSArray *specSymb = [NSArray arrayWithObjects:@".", @";", @":", @",", nil];
		int idx = 0;
		while (idx < [specSymb count]) {
				lineForTest = [lineForTest stringByReplacingOccurrencesOfString: specSymb[idx] withString:@""];
				idx++;
		}

		//1 Break the line by words
		NSMutableArray *parts = [NSMutableArray arrayWithArray:
																						[lineForTest componentsSeparatedByCharactersInSet:
																						[NSCharacterSet  whitespaceCharacterSet]]];

		[parts removeObjectIdenticalTo:@""];

		// calculate
		int ind = 0;
		NSMutableString *res;
		int maxCount = 0;
		int minCount = 0;
		BOOL firstIn = TRUE;
		for (ind; ind < parts.count; ind++) {
				res = [parts objectAtIndex: ind];

				int countRes = (int)[res length];
				maxCount = countRes > maxCount ? countRes : maxCount;

				if (firstIn && countRes > 0) {
						firstIn = FALSE;
						minCount = countRes;
				} else {
						minCount = countRes < minCount ? countRes : minCount;
				}

		}

		NSLog(@"max. length = '%d'; min. length = '%d'.", maxCount, minCount);
}


@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
			SampleLineClass *sampleClass = [SampleLineClass new];

			//#1
			[sampleClass testSomeLine];
	}

    return 0;
}
