//
//  CalculatorBrain.h
//  CalcUI
//
//  Created by Nikolay Dementiev on 05.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject

@property (nonatomic, strong) NSMutableArray *programStack;
@property (nonatomic, readonly) id program;
  
- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
- (void)clearHistory;
+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
