//
//  OutputInformation.m
//  CarOwnersCatalog4
//
//  Created by Nikolay Dementiev on 04.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OutputInformation.h"
#import "OutputInformationController.h"

@implementation OutputInformation

- (void) makePrintTestInformation {

		OutputInformationController *outtestInfo = [OutputInformationController new];
		NSError *error;

		//1. add data
		error = nil;
		[outtestInfo addInformationToDataBase: &error];
		if(error) {
				NSLog(@"Error in func.:'addInformationToDataBase': %@",error);
		};

		//2. delete data
		error = nil;
		[outtestInfo deteleRecordFromDataBase: &error];
		if(error) {
				NSLog(@"Error in func.:'deteleRecordFromDataBase': %@",error);
		};

		//3. edit data
		error = nil;
		[outtestInfo editRecordInDataBase: &error];
		if(error) {
				NSLog(@"Error in func.:'editRecordInDataBase': %@",error);
		};

		//4. finding record
		error = nil;
		NSDictionary *recordFinded = [outtestInfo findRecordInDataBase: &error];
		if(error) {
				NSLog(@"Error in func.:'findRecordInDataBase': %@",error);
		} else {
				if (recordFinded) {
						NSLog(@"Searched car owner of car number '%@' is '%@'", recordFinded[@"car"], recordFinded[@"owner"]);
				} else {
						NSLog(@"There were some problems to find data with car owner '%@' and car number '%@'"
									, recordFinded[@"owner"]
									, recordFinded[@"car"]);
				};
		};

		//5. print sorted array
		error = nil;
		NSString *logForPrint = [outtestInfo printSortedDataFromDataBase: &error];
		if(error) {
				NSLog(@"Error in func.:'printSortedDataFromDataBase': %@",error);
		} else {
				NSLog(@"%@",logForPrint);
		};		
};

@end
