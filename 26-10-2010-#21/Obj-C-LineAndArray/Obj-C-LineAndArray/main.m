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
- (void) CalculateTheMinimumAndMaximumNumberOfCharactersPerLine;
- (void) CalculateHowManyDifferentSymbolsOccursOnLine;

@end

@implementation SampleLineClass

//MARK: - Lines
//MARK: #1
- (void) CalculateTheMinimumAndMaximumNumberOfCharactersPerLine {
		NSLog(@ "#1 - CalculateTheMinimumAndMaximumNumberOfCharactersPerLine");

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

//MARK: #2



-(void) CalculateHowManyDifferentSymbolsOccursOnLine {
		NSLog(@ "#2 - CalculateHowManyDifferentSymbolsOccursOnLine");

		NSString *lineForTest = @"ДДана строка. Подсчитать, сколько различных символов встречается в ней. Вывести их на экран";

		NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

		for (int i=0; i<[lineForTest length];i++) {
				NSString *chr = [lineForTest substringWithRange:NSMakeRange(i,1)];

				NSNumber *elementValue = [dictionary valueForKey:chr];

				NSNumber *count;
				if (elementValue != NULL) {
						int value = [elementValue intValue];
						count = [NSNumber numberWithInt: value+1];
				} else {
						count = @1;
				}

				[dictionary setValue:count forKey:chr];
		}

		//print result
		NSString * strOutPut = @"";
		for(NSString *key in [dictionary allKeys]) {
				strOutPut = [strOutPut stringByAppendingFormat: @"%@'%@'(%@)" ,([strOutPut length] > 0 ? @", ": @" "), key, [dictionary valueForKey:key]];
		}
		NSLog(@ "Symbol calc result (format is: ''symbol' (occurs times)'): \n %@", strOutPut);

}

@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
			SampleLineClass *sampleClass = [SampleLineClass new];

			//#1
			[sampleClass CalculateTheMinimumAndMaximumNumberOfCharactersPerLine];

			//#2
			[sampleClass CalculateHowManyDifferentSymbolsOccursOnLine];

	}

    return 0;
}
