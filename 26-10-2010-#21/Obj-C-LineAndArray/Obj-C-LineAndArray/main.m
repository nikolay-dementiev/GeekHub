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
- (void) FindTheWordThatBeginsAndEndsWithTheSameLetter;

+ (NSString *) RemoveSpecialSymbolsInTheLine: (NSString *)line;
@end

@implementation SampleLineClass

//MARK: - Lines

+ (NSString *) RemoveSpecialSymbolsInTheLine: (NSString *)line {
		//remove special symbols
		NSArray *specSymb = [NSArray arrayWithObjects:@".", @";", @":", @",", nil];
		int idx = 0;
		while (idx < [specSymb count]) {
				line = [line stringByReplacingOccurrencesOfString: specSymb[idx] withString:@""];
				idx++;
		}

		return line;
}


//MARK: #1
- (void) CalculateTheMinimumAndMaximumNumberOfCharactersPerLine {
		NSLog(@ "#1 - CalculateTheMinimumAndMaximumNumberOfCharactersPerLine");

		NSString *lineForTest = @"Дана строка, содержащая текст. Найти длину самого короткого слова и самого длинного слова.";


		lineForTest = [SampleLineClass RemoveSpecialSymbolsInTheLine: lineForTest];

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

		NSString *lineForTest = @"Дана строка. Подсчитать, сколько различных символов встречается в ней. Вывести их на экран";

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

//MARK: #3

- (void) FindTheWordThatBeginsAndEndsWithTheSameLetter {
		NSLog(@ "#3 - FindTheWordThatBeginsAndEndsWithTheSameLetter");

		NSString *lineForTest = @"Дана строкас. Найти в ней те слова, которые начинаются и оканчиваются одной и той же буквой.";

		lineForTest = [SampleLineClass RemoveSpecialSymbolsInTheLine: lineForTest];

		//1 Break the line by words
		NSMutableArray *parts = [NSMutableArray arrayWithArray:
														 [lineForTest componentsSeparatedByCharactersInSet:
															[NSCharacterSet  whitespaceCharacterSet]]];

		[parts removeObjectIdenticalTo:@""];

		int ind = 0;
		NSString *res;
		NSString *firstLetter;
		NSString *lastLetter;

		NSMutableArray* theSameLetterWords = [NSMutableArray new];

		for (ind; ind < parts.count; ind++) {
				res = [parts objectAtIndex: ind];

				int countRes = (int)[res length];
				if (countRes > 0) {
						firstLetter = [res substringToIndex: 1];
						lastLetter = [res substringFromIndex: countRes-1];

						if ([firstLetter caseInsensitiveCompare:lastLetter] == NSOrderedSame) {
								//strings are same
								NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", res];
								NSArray *results = [theSameLetterWords filteredArrayUsingPredicate:predicate];

								if ([results count] == 0) {
										[theSameLetterWords addObject:res];
								}
						}
				}
		}

		//Output the results of calculations

		NSString * strOutPut = @"";
		for(id element in theSameLetterWords) {
				strOutPut = [strOutPut stringByAppendingFormat: @"%@'%@'" ,
										 ([strOutPut length] > 0 ? @", ": @" "),
										 [element description]];
		}
		NSLog(@ "Words that begins and ends with the same letter:  %@", strOutPut);

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

			//#3
			[sampleClass FindTheWordThatBeginsAndEndsWithTheSameLetter];

	}

    return 0;
}
