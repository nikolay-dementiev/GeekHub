//
//  Helper.m
//  ShoppingList
//
//  Created by Nikolay Dementiev on 18.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Helper.h"

@implementation NSDate(DateRepresentation)

- (NSString *)representData {

//    "2018-03-05 08:14:19 +0000"
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // here we create NSDateFormatter object for change the Format of date..
    //https://www.parse.com/questions/how-do-add-a-date-using-a-rest-post-request
    //@"yyyy-MM-dd'T'HH:mm:ssZ"
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"]; //Here we can set the format which we need
    NSString *convertedDateString = [dateFormatter stringFromDate:self];// here convert date in

    return convertedDateString;
}
@end
