//
//  ViewController.m
//  CalcUI
//
//  Created by Nikolay Dementiev on 02.12.16.
//  Copyright © 2016 mc373. All rights reserved.
//

#import "CalcViewController.h"
#import "CalculatorBrain.h"

@interface CalcViewController () {
    NSString *lastOperation;
}

@property (nonatomic) BOOL isInTheMiddleOfEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    lastOperation = @"";
}

- (CalculatorBrain *)calBrain
{
    if (!self.brain) {
        self.brain = [CalculatorBrain new];
    }
    
    return self.brain;
}


- (IBAction)numberButtonSet:(UIButton *)sender
{
    NSString *digit = sender.currentTitle;

    // change sign function if it's an negative number reverse it，otherwise do the same thing.
    if ([digit isEqualToString:@"+/-"]) {
        if ([[self.display.text substringToIndex:1] isEqualToString:@"-"]) {
            self.display.text = [self.display.text substringFromIndex:1];
        } else {
            self.display.text = [@"-" stringByAppendingString:self.display.text];
        }
    } else {
        if (self.isInTheMiddleOfEnteringNumber) {
            self.display.text = [self.display.text stringByAppendingString:digit];
        } else {
            self.display.text = digit;
            self.isInTheMiddleOfEnteringNumber = YES;
        }
    }
}


- (IBAction)operationButtonSet:(UIButton *)sender 
{
    lastOperation = sender.currentTitle;

    if (self.isInTheMiddleOfEnteringNumber) {
        [self doSomeWorkAfterEnterPress];
    }
}

- (IBAction)clearButtonPressed:(UIButton *)sender 
{
    [self.calBrain clearHistory];
    self.display.text = @"0";
    lastOperation = @"";
    self.isInTheMiddleOfEnteringNumber = false;
}

- (IBAction)calculateButtonPressed:(UIButton *)sender 
{
    if ([lastOperation isEqualToString:@""]) {
        return;
    }

    //add second operator
    [self doSomeWorkAfterEnterPress];
    double result = [self.calBrain performOperation:lastOperation];

    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

- (void)doSomeWorkAfterEnterPress 
{
    [self.calBrain pushOperand:[self.display.text doubleValue]];

    self.isInTheMiddleOfEnteringNumber = NO;
}

@end

