//
//  CalculatorBrain.m
//  CalcUI
//
//  Created by Nikolay Dementiev on 05.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ()
@end

@implementation CalculatorBrain


-(NSMutableArray *)programStack
{
    if (_programStack == nil) {
        _programStack = [[NSMutableArray alloc]init];
    }
    return _programStack;
}

-(void)pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}


-(double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [[self class] runProgram:self.programStack];
}

-(id)program
{
    return [self.program copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"";
}

+ (double)popOperandOffStack:(NSMutableArray *)stack
{
    double result = 0;

    id topStack = [stack lastObject];
    if (topStack)
    {
        [stack removeLastObject];
    }
    if ([topStack isKindOfClass:[NSNumber class]])
    {
        result = [topStack doubleValue];
    }
    else if([topStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topStack;
        //normal function for calculator
        if ([operation isEqualToString:@"+"])
        {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        }
        else if ([operation isEqualToString:@"×"])
        {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        }
        else if ([operation isEqualToString:@"-"])
        {
            double subtractor = [self popOperandOffStack:stack];
            double subtracted = [self popOperandOffStack:stack];
            result = subtracted - subtractor;
        }
        else if ([operation isEqualToString:@"÷"])
        {
            double divider = [self popOperandOffStack:stack];
            double dividend = [self popOperandOffStack:stack];
            result = dividend / divider;
        }
        else if ([operation isEqualToString:@"%"])
        {
            double allV = [self popOperandOffStack:stack];
            double curV = [self popOperandOffStack:stack];

            result = (allV * curV)/100;
        }


    }
    return result;
}

+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]])
    {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}

//remove all the calculator history
- (void)clearHistory
{
    [self.programStack removeAllObjects];
}

@end
